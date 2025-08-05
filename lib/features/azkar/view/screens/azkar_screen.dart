import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/core/share/widgets/custom_search_bar.dart';
import 'package:jalees/core/share/widgets/gradient_background.dart';
import 'package:jalees/features/azkar/cubit/azkar_cubit.dart';
import 'package:jalees/features/azkar/cubit/azkar_state.dart';
import 'package:jalees/features/azkar/view/widgets/azkar_card.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..getAzkar(),
      child: GradientScaffold(
        appBar: AppBar(title: const Text('الأذكار'), centerTitle: true),
        body: Column(
          children: [
            CustomSearchBar(
              hintText: 'ابحث في الأذكار...',
              onChanged: (val) => setState(() => search = val),
            ),
            Expanded(
              child: BlocBuilder<AzkarCubit, AzkarState>(
                builder: (context, state) {
                  if (state is GetAzkarLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetAzkarErrorState) {
                    return Center(child: Text(state.error));
                  } else {
                    final cubit = AzkarCubit.get(context);
                    final filteredAzkar = cubit.azkar.where((azkar) {
                      return (azkar.category?.contains(search) ?? false) ||
                          azkar.count.toString().contains(search) ||
                          (azkar.description?.contains(search) ?? false);
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredAzkar.length,
                      itemBuilder: (context, index) {
                        return AzkarCard(azkarModel: filteredAzkar[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

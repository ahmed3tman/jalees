import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/features/azkar/cubit/azkar_cubit.dart';
import 'package:jalees/features/azkar/cubit/azkar_state.dart';
import 'package:jalees/features/azkar/view/widgets/azkar_card.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AzkarCubit()..getAzkar(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الأذكار'),
          centerTitle: true,
        ),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is GetAzkarLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAzkarErrorState) {
              return Center(child: Text(state.error));
            } else {
              final cubit = AzkarCubit.get(context);
              return ListView.builder(
                itemCount: cubit.azkar.length,
                itemBuilder: (context, index) {
                  return AzkarCard(azkarModel: cubit.azkar[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

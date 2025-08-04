import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/core/share/widgets/custom_search_bar.dart';
import 'package:jalees/features/quran/view/widgets/sura_card.dart';
import '../../cubit/quran_cubit.dart';
import '../../cubit/quran_state.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..loadQuran(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('القرآن الكريم'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CustomSearchBar(
              hintText: 'ابحث عن سورة...',
              onChanged: (val) => setState(() => search = val),
            ),
            Expanded(
              child: BlocBuilder<QuranCubit, QuranState>(
                builder: (context, state) {
                  if (state is QuranLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QuranError) {
                    return Center(child: Text('حدث خطأ: ${state.message}'));
                  } else if (state is QuranLoaded) {
                    final surahs = state.surahs
                        .where((s) => s.name.contains(search))
                        .toList();
                    if (surahs.isEmpty) {
                      return const Center(child: Text('لا توجد نتائج'));
                    }
                    return ListView.builder(
                      itemCount: surahs.length,
                      itemBuilder: (context, index) {
                        return SuraCard(sura: surahs[index]);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


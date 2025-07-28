import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/features/quran/view/widgets/sura_card.dart';
import '../../cubit/quran_cubit.dart';
import '../../cubit/quran_state.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuranCubit()..loadQuran(),
      child: Scaffold(
        appBar: AppBar(title: const Text('القرآن الكريم')),
        body: BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            if (state is QuranLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuranError) {
              return Center(child: Text('حدث خطأ: ${state.message}'));
            } else if (state is QuranLoaded) {
              final surahs = state.surahs;
              if (surahs.isEmpty) {
                return const Center(child: Text('لا توجد بيانات'));
              }
              return SuraCard(surahs: surahs);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}


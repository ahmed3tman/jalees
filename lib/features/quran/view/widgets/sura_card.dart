import 'package:flutter/material.dart';
import 'package:jalees/features/quran/model/quran_model.dart';
import '../screens/ayat_screen.dart';

class SuraCard extends StatelessWidget {
  const SuraCard({super.key, required this.surahs});

  final List<QuranSurah> surahs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, index) {
        final surah = surahs[index];
        return ListTile(
          title: Text(surah.name),
          subtitle: Row(
            children: [
              Text('عدد الآيات: ${surah.totalVerses}'),
              const SizedBox(width: 10),
              Text('النوع: ${surah.type == "meccan" ? "مكية" : "مدنية"}'),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AyatScreen(surah: surah)),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jalees/features/quran/model/quran_model.dart';
import '../screens/ayat_screen.dart';

class SuraCard extends StatelessWidget {
  const SuraCard({super.key, required this.sura});

  final QuranSurah sura;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            sura.id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          sura.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          'الآيات: ${sura.totalVerses} | النوع: ${sura.type == "meccan" ? "مكية" : "مدنية"}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.primary),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AyatScreen(surah: sura)),
          );
        },
      ),
    );
  }
}

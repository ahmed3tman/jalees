import 'package:flutter/material.dart';
import '../../model/quran_model.dart';

class AyatScreen extends StatelessWidget {
  final QuranSurah surah;
  const AyatScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.name)),
      body: ListView.builder(
        itemCount: surah.verses.length,
        itemBuilder: (context, index) {
          final verse = surah.verses[index];
          return ListTile(
            leading: CircleAvatar(child: Text('${verse.id}')),
            title: Text(
              verse.text,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}

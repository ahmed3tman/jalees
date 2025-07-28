import 'package:flutter/material.dart';
import 'package:jalees/features/bukhari/model/hadeeth_mode.dart';
import 'package:jalees/features/bukhari/view/widgets/hadeeth_card.dart';

class HadithsListScreen extends StatelessWidget {
  final Chapter chapter;
  final List<Hadith> hadiths;
  const HadithsListScreen({
    super.key,
    required this.chapter,
    required this.hadiths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.arabic, textDirection: TextDirection.rtl),
      ),
      body: hadiths.isEmpty
          ? const Center(child: Text('لا يوجد أحاديث في هذا الكتاب'))
          : HadeethListCard(hadiths: hadiths),
    );
  }
}

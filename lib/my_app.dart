import 'package:flutter/material.dart';
import 'package:jalees/features/nav/view/screens/nav_screen.dart';
import 'package:jalees/features/quran/view/screens/quran_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'nav': (context) => const Nav(),
        'quran': (context) => const QuranScreen(),
      },
      title: 'Jalees',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      home: const Nav(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jalees/core/share/widgets/gradient_background.dart';

class JadwaliScreen extends StatelessWidget {
  const JadwaliScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(title: const Text('جدولي')),
      body: const Center(child: Text('صفحة جدولي')),
    );
  }
}

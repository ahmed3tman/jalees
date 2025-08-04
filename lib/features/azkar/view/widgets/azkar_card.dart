import 'package:flutter/material.dart';
import 'package:jalees/features/azkar/model/azkar_model.dart';

class AzkarCard extends StatelessWidget {
  final AzkarModel azkarModel;

  const AzkarCard({super.key, required this.azkarModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              azkarModel.zekr ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            if (azkarModel.description != null && azkarModel.description!.isNotEmpty)
              Text(
                azkarModel.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (azkarModel.count != null)
                  Text(
                    'التكرار: ${azkarModel.count}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                if (azkarModel.reference != null && azkarModel.reference!.isNotEmpty)
                  Text(
                    azkarModel.reference!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

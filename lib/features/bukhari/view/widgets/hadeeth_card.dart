import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jalees/features/bukhari/model/hadeeth_mode.dart';
import '../../../../core/theme/app_fonts.dart';

class HadeethCard extends StatelessWidget {
  const HadeethCard({super.key, required this.hadith});

  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    String narrator = '';
    String source = 'صحيح البخاري';
    if (hadith.english is Map && hadith.english['narrator'] != null) {
      narrator = hadith.english['narrator'];
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withOpacity(0.9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // نص الحديث
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                  ),
                ),
                child: Text(
                  hadith.arabic,
                  textDirection: TextDirection.rtl,
                  style: AppFonts.hadithTextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),

              const SizedBox(height: 16),

              // معلومات الحديث
              if (narrator.isNotEmpty) ...[
                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'الراوي: $narrator',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],

              Row(
                children: [
                  Icon(
                    Icons.book_outlined,
                    size: 18,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'المصدر: $source',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // أزرار الإجراءات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final text =
                            hadith.arabic +
                            (hadith.english is Map &&
                                    hadith.english['text'] != null
                                ? '\n' + hadith.english['text']
                                : '');
                        Clipboard.setData(ClipboardData(text: text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم النسخ',
                              style: TextStyle(fontFamily: 'GeneralFont'),
                            ),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, size: 18),
                      label: const Text('نسخ'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        final text =
                            hadith.arabic +
                            (hadith.english is Map &&
                                    hadith.english['text'] != null
                                ? '\n' + hadith.english['text']
                                : '');
                        // مشاركة النص
                        // يمكنك استخدام حزمة share_plus هنا
                      },
                      icon: const Icon(Icons.share, size: 18),
                      label: const Text('مشاركة'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

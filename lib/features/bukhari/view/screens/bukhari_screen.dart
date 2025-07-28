import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/features/bukhari/view/screens/hadeeth_list_screen.dart';
import '../../cubit/bukhari_cubit.dart';

class BukhariScreen extends StatefulWidget {
  const BukhariScreen({super.key});

  @override
  State<BukhariScreen> createState() => _BukhariScreenState();
}

class _BukhariScreenState extends State<BukhariScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BukhariCubit()..loadBukhari(),
      child: Scaffold(
        appBar: AppBar(title: const Text('أحاديث البخاري')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن فصل أو عنوان...',
                ),
                onChanged: (val) => setState(() => search = val),
              ),
            ),
            Expanded(
              child: BlocBuilder<BukhariCubit, BukhariState>(
                builder: (context, state) {
                  if (state is BukhariLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BukhariLoaded) {
                    final chapters = state.book.chapters
                        .where(
                          (c) =>
                              c.arabic.contains(search) ||
                              c.english.toLowerCase().contains(
                                search.toLowerCase(),
                              ),
                        )
                        .toList();
                    if (chapters.isEmpty) {
                      return const Center(child: Text('لا يوجد نتائج'));
                    }
                    return ListView.builder(
                      itemCount: chapters.length,
                      itemBuilder: (context, index) {
                        final chapter = chapters[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          child: ListTile(
                            title: Text(
                              chapter.arabic,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              chapter.english,
                              style: const TextStyle(fontSize: 14),
                            ),
                            onTap: () {
                              final state = context.read<BukhariCubit>().state;
                              if (state is BukhariLoaded) {
                                final hadiths = state.book.hadiths
                                    .where((h) => h.chapterId == chapter.id)
                                    .toList();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => HadithsListScreen(
                                      chapter: chapter,
                                      hadiths: hadiths,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is BukhariError) {
                    return Center(child: Text('خطأ: ${state.message}'));
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ChapterDetailScreen extends StatelessWidget {
//   final dynamic data;
//   const ChapterDetailScreen({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('تفاصيل الفصل')),
//       body: _buildDetails(context, data),
//     );
//   }

//   Widget _buildDetails(BuildContext context, dynamic value) {
//     if (value is List) {
//       return ListView.builder(
//         itemCount: value.length,
//         itemBuilder: (ctx, i) => ListTile(
//           title: Text('عنصر ${i + 1}'),
//           onTap: () => Navigator.of(ctx).push(
//             MaterialPageRoute(
//               builder: (_) => ChapterDetailScreen(data: value[i]),
//             ),
//           ),
//         ),
//       );
//     } else if (value is Map) {
//       return ListView(
//         children: value.entries.map<Widget>((e) {
//           final isNested = e.value is Map || e.value is List;
//           return ListTile(
//             title: Text(
//               e.key.toString(),
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: isNested ? null : Text(e.value.toString()),
//             trailing: isNested ? const Icon(Icons.arrow_forward_ios) : null,
//             onTap: isNested
//                 ? () => Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (_) => ChapterDetailScreen(data: e.value),
//                     ),
//                   )
//                 : null,
//           );
//         }).toList(),
//       );
//     } else {
//       return Center(child: Text(value.toString()));
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jalees/core/share/widgets/custom_search_bar.dart';
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
        appBar: AppBar(
          title: const Text('أحاديث البخاري'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CustomSearchBar(
              hintText: 'ابحث عن فصل أو عنوان...',
              onChanged: (val) => setState(() => search = val),
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
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            subtitle: Text(
                              chapter.english,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            onTap: () {
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


// موديل HadeethBook هو الموديل الرئيسي لكتاب البخاري ويحتوي على بيانات الكتاب والفصول والأحاديث.
// مستخدم في Cubit (bukhari_cubit.dart) لجلب وتحميل البيانات، ومستخدم في واجهة العرض (bukhari_screen.dart) لعرض الكتب والأحاديث.
class HadeethBook {
  final int id;
  final Metadata metadata;
  final List<Chapter> chapters;
  final List<Hadith> hadiths;

  HadeethBook({
    required this.id,
    required this.metadata,
    required this.chapters,
    required this.hadiths,
  });

  factory HadeethBook.fromJson(Map<String, dynamic> json) {
    return HadeethBook(
      id: json['id'],
      metadata: Metadata.fromJson(json['metadata']),
      chapters: (json['chapters'] as List)
          .map((e) => Chapter.fromJson(e))
          .toList(),
      hadiths:
          (json['hadiths'] as List?)?.map((e) => Hadith.fromJson(e)).toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'metadata': metadata.toJson(),
    'chapters': chapters.map((e) => e.toJson()).toList(),
    'hadiths': hadiths.map((e) => e.toJson()).toList(),
  };
}

// موديل Hadith يمثل الحديث الواحد (النص العربي والإنجليزي وبيانات الربط).
// مستخدم في HadeethBook (قائمة hadiths)، ويُستخدم في شاشة عرض الأحاديث (HadithsListScreen) لعرض كل حديث في كارد.
class Hadith {
  final int id;
  final int idInBook;
  final int chapterId;
  final int bookId;
  final String arabic;
  final dynamic english;

  Hadith({
    required this.id,
    required this.idInBook,
    required this.chapterId,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      id: json['id'],
      idInBook: json['idInBook'],
      chapterId: json['chapterId'],
      bookId: json['bookId'],
      arabic: json['arabic'] ?? '',
      english: json['english'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'idInBook': idInBook,
    'chapterId': chapterId,
    'bookId': bookId,
    'arabic': arabic,
    'english': english,
  };
}

// موديل Metadata يحتوي بيانات وصفية عن الكتاب (العنوان، المؤلف، المقدمة).
// مستخدم داخل HadeethBook (حقل metadata) ويُستخدم فقط للعرض أو المعلومات العامة عن الكتاب.
class Metadata {
  final int id;
  final int length;
  final LanguageInfo arabic;
  final LanguageInfo english;

  Metadata({
    required this.id,
    required this.length,
    required this.arabic,
    required this.english,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      id: json['id'],
      length: json['length'],
      arabic: LanguageInfo.fromJson(json['arabic']),
      english: LanguageInfo.fromJson(json['english']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'length': length,
    'arabic': arabic.toJson(),
    'english': english.toJson(),
  };
}

// موديل LanguageInfo يمثل بيانات اللغة (العنوان، المؤلف، المقدمة) لكل لغة.
// مستخدم داخل Metadata (حقل arabic و english) فقط.
class LanguageInfo {
  final String title;
  final String author;
  final String introduction;

  LanguageInfo({
    required this.title,
    required this.author,
    required this.introduction,
  });

  factory LanguageInfo.fromJson(Map<String, dynamic> json) {
    return LanguageInfo(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      introduction: json['introduction'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'author': author,
    'introduction': introduction,
  };
}

// موديل Chapter يمثل الفصل أو الكتاب الفرعي داخل صحيح البخاري.
// مستخدم في HadeethBook (قائمة chapters)، ويُستخدم في شاشة عرض الكتب (BukhariScreen) لعرض قائمة الكتب، وعند الضغط عليه يتم عرض الأحاديث الخاصة به.
class Chapter {
  final int id;
  final int bookId;
  final String arabic;
  final String english;

  Chapter({
    required this.id,
    required this.bookId,
    required this.arabic,
    required this.english,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'],
      bookId: json['bookId'],
      arabic: json['arabic'] ?? '',
      english: json['english'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'bookId': bookId,
    'arabic': arabic,
    'english': english,
  };
}

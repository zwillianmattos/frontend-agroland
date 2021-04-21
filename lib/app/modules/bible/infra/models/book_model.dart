import 'dart:convert';

import 'package:app_inside/app/modules/bible/domain/entities/book.dart';

class BookModel extends Book {
  final String abbrev;
  final List<dynamic> chapters;
  final String name;

  BookModel({
    required this.abbrev, 
    required this.chapters, 
    required this.name}
  ) : super(abbrev: abbrev, chapters: chapters, name: name);


  Map<String, dynamic> toMap() {
    return {
      'abbrev': abbrev,
      'name': name,
      'chapters': chapters
    };
  }


  static BookModel fromMap(Map<String, dynamic> map) {
    return BookModel(
      abbrev: map['abbrev'],
      chapters: jsonDecode(map['chapters']),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static BookModel fromJson(String source) => fromMap(json.decode(source));
}
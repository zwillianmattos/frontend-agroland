import 'category.dart';

class Ebook {
  final int? id;
  final String? name;
  final String? author;
  final String? description;
  final String? file;
  final String? createdAt;
  final Category? category;

  const Ebook({
    this.id,
    this.name,
    this.author,
    this.description,
    this.file,
    this.createdAt,
    this.category,
  });

  factory Ebook.fromJson(Map<String, dynamic> json) {
    return Ebook(
      id: json['id'] as int?,
      name: json['name'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      file: json['file'] as String?,
      createdAt: json['createdAt'] as String?,
      category: json['Category'] == null
          ? null
          : Category.fromJson(json['Category'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'description': description,
      'file': file,
      'createdAt': createdAt,
      'Category': category?.toJson(),
    };
  }
}

import 'category.dart';
import 'rating.dart';

class Ebook {
  int? id;
  String? name;
  String? author;
  String? description;
  String? file;
  String? createdAt;
  Category? category;
  List<Rating>? rating;

  Ebook(
      {this.id,
      this.name,
      this.author,
      this.description,
      this.file,
      this.createdAt,
      this.category,
      this.rating});

  Ebook.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    author = json['author'];
    description = json['description'];
    file = json['file'];
    createdAt = json['createdAt'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    if (json['Ratings'] != null) {
      rating = <Rating>[];
      json['Ratings'].forEach((v) {
        print(v);
        rating!.add(new Rating.fromJson(v));
      });
    }
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
      'Ratings': rating?.map((r) => r.toJson()),
    };
  }
}

class Category {
  final String? description;

  const Category({this.description});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
    };
  }
}

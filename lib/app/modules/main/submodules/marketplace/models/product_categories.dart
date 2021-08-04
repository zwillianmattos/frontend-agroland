class ProductCategories {
  int? id;
  String? description;
  int? excluded;
  String? createdAt;
  String? updatedAt;

  ProductCategories({
    this.id,
    this.description,
    this.excluded,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'ProductCategories(id: $id, description: $description, excluded: $excluded, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory ProductCategories.fromJson(Map<String, dynamic> json) =>
      ProductCategories(
        id: json['id'] as int?,
        description: json['description'] as String?,
        excluded: json['excluded'] as int?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'excluded': excluded,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  ProductCategories copyWith({
    int? id,
    int? productId,
    String? description,
    int? excluded,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProductCategories(
      id: id ?? this.id,
      description: description ?? this.description,
      excluded: excluded ?? this.excluded,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

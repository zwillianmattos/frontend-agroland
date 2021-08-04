class CultureContent {
  int? id;
  String? description;
  int? cultureCategoryRel;
  Map<String, dynamic>? content;
  int? excluded;
  String? createdAt;
  String? updatedAt;

  CultureContent({
    this.id,
    this.description,
    this.cultureCategoryRel,
    this.content,
    this.excluded,
    this.createdAt,
    this.updatedAt,
  });

  factory CultureContent.fromJson(Map<String, dynamic> json) => CultureContent(
        id: json['id'] as int?,
        description: json['description'] as String?,
        cultureCategoryRel: json['cultureCategoryRel'] as int?,
        content: json['content']  as Map<String, dynamic>?,
        excluded: json['excluded'] as int?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'cultureCategoryRel': cultureCategoryRel,
        'content': content,
        'excluded': excluded,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

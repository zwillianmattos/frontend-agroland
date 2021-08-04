class CulturesCategory {
  dynamic icon;
  String? description;

  CulturesCategory({this.icon, this.description});

  factory CulturesCategory.fromJson(Map<String, dynamic> json) =>
      CulturesCategory(
        icon: json['icon'],
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'description': description,
      };
}

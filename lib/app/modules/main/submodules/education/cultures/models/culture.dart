import 'cultures_categories_rels.dart';

class Culture {
  int? id;
  String? name;
  dynamic icon;
  dynamic description;
  List<CulturesCategoriesRels>? culturesCategoriesRels;

  Culture({
    this.id,
    this.name,
    this.icon,
    this.description,
    this.culturesCategoriesRels,
  });

  factory Culture.fromJson(Map<String, dynamic> json) => Culture(
        id: json['id'] as int?,
        name: json['name'] as String?,
        icon: json['icon'],
        description: json['description'],
        culturesCategoriesRels:
            (json['CulturesCategoriesRels'] as List<dynamic>?)
                ?.map((e) =>
                    CulturesCategoriesRels.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'CulturesCategoriesRels':
            culturesCategoriesRels?.map((e) => e.toJson()).toList(),
      };
}

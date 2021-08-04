import 'culture_content.dart';
import 'cultures_category.dart';

class CulturesCategoriesRels {
  int? id;
  int? cultureCategory;
  int? culture;
  CulturesCategory? culturesCategory;
  List<CultureContent>? culturesContents;

  CulturesCategoriesRels({
    this.id,
    this.cultureCategory,
    this.culture,
    this.culturesCategory,
    this.culturesContents,
  });

  factory CulturesCategoriesRels.fromJson(Map<String, dynamic> json) =>
      CulturesCategoriesRels(
        id: json['id'] as int?,
        cultureCategory: json['cultureCategory'] as int?,
        culture: json['culture'] as int?,
        culturesCategory: json['CulturesCategory'] == null
            ? null
            : CulturesCategory.fromJson(
                json['CulturesCategory'] as Map<String, dynamic>),
        culturesContents: json['CulturesContents'] == null
            ? null
            : (json['CulturesContents'] as List<dynamic>?)
                ?.map((e) => CultureContent.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cultureCategory': cultureCategory,
        'culture': culture,
        'CulturesCategory': culturesCategory?.toJson(),
        'CulturesContents': culturesContents?.map((e) => e.toJson()).toList(),
      };
}

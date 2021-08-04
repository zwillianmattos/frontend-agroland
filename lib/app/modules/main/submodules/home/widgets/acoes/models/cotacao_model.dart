import 'cultures.dart';

class CotacaoModel {
  String? description;
  String? updatedAt;
  List<Cultures>? cultures;

  CotacaoModel({this.description, this.updatedAt, this.cultures});

  @override
  String toString() {
    return 'CotacaoModel(description: $description, updatedAt: $updatedAt, cultures: $cultures)';
  }

  factory CotacaoModel.fromJson(Map<String, dynamic> json) => CotacaoModel(
        description: json['description'] as String?,
        updatedAt: json['updated_at'] as String?,
        cultures: (json['cultures'] as List<dynamic>?)
            ?.map((e) => Cultures.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'updated_at': updatedAt,
        'cultures': cultures?.map((e) => e.toJson()).toList(),
      };

  CotacaoModel copyWith({
    String? description,
    String? updatedAt,
    List<Cultures>? cultures,
  }) {
    return CotacaoModel(
      description: description ?? this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      cultures: cultures ?? this.cultures,
    );
  }
}

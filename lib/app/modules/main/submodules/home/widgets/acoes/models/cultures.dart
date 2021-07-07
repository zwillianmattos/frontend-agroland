import 'data.dart';

class Cultures {
	String? description;
	List<AcoesData>? data;

	Cultures({this.description, this.data});

	@override
	String toString() => 'Cultures(description: $description, data: $data)';

	factory Cultures.fromJson(Map<String, dynamic> json) => Cultures(
				description: json['description'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => AcoesData.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'description': description,
				'data': data?.map((e) => e.toJson()).toList(),
			};

		Cultures copyWith({
		String? description,
		List<AcoesData>? data,
	}) {
		return Cultures(
			description: description ?? this.description,
			data: data ?? this.data,
		);
	}
}

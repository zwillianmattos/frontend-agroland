
import 'package:agro_tools/app/modules/account/models/user.dart';

class Rating {
	int? excluded;
	int? id;
	int? user;
	String? document;
	double? rating;
	String? comment;
	String? updatedAt;
	String? createdAt;
  User? userObj;

	Rating({
		this.excluded, 
		this.id, 
		this.user, 
		this.document, 
		this.rating, 
		this.comment, 
		this.updatedAt, 
		this.createdAt, 
    this.userObj
	});

	@override
	String toString() {
		return 'Rating(excluded: $excluded, id: $id, user: $user, document: $document, rating: $rating, comment: $comment, updatedAt: $updatedAt, createdAt: $createdAt)';
	}

	factory Rating.fromJson(Map<String, dynamic> json) => Rating(
				excluded: json['excluded'] as int?,
				id: json['id'] as int?,
				user: json['user'] as int?,
				document: json['document'] as String?,
				rating: json['rating'] is int ? (json['rating']).toDouble() : json['rating'] as double?,
				comment: json['comment'] as String?,
				updatedAt: json['updatedAt'] as String?,
				createdAt: json['createdAt'] as String?,
        userObj: json['User'] != null ? User.fromJson(json['User'] as Map<String, dynamic>) : null
			);

	Map<String, dynamic> toJson() => {
				'excluded': excluded,
				'id': id,
				'user': user,
				'document': document,
				'rating': rating,
				'comment': comment,
				'updatedAt': updatedAt,
				'createdAt': createdAt,
        'userObj': userObj
			};

		Rating copyWith({
		int? excluded,
		int? id,
		int? user,
		String? document,
		double? rating,
		String? comment,
		String? updatedAt,
		String? createdAt,
    User? userObj
	}) {
		return Rating(
			excluded: excluded ?? this.excluded,
			id: id ?? this.id,
			user: user ?? this.user,
			document: document ?? this.document,
			rating: rating ?? this.rating,
			comment: comment ?? this.comment,
			updatedAt: updatedAt ?? this.updatedAt,
			createdAt: createdAt ?? this.createdAt,
      userObj: userObj ?? this.userObj
		);
	}
}



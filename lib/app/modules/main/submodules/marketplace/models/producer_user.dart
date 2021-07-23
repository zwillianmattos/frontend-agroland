class ProducerUser {
	int? id;
	int? user;
	String? corporateName;
	String? fantasyName;
	String? cnpj;
	String? description;
	String? location;
	String? imgLogo;
	String? phone;
	int? address;
	String? facebook;
	String? instagram;
	String? whatsapp;
	String? twitter;
	int? excluded;
	String? createdAt;
	String? updatedAt;

	ProducerUser({
		this.id, 
		this.user, 
		this.corporateName, 
		this.fantasyName, 
		this.cnpj, 
		this.description, 
		this.location, 
		this.imgLogo, 
		this.phone, 
		this.address, 
		this.facebook, 
		this.instagram, 
		this.whatsapp, 
		this.twitter, 
		this.excluded, 
		this.createdAt, 
		this.updatedAt, 
	});

	@override
	String toString() {
		return 'ProducerUser(id: $id, user: $user, corporateName: $corporateName, fantasyName: $fantasyName, cnpj: $cnpj, description: $description, location: $location, imgLogo: $imgLogo, phone: $phone, address: $address, facebook: $facebook, instagram: $instagram, whatsapp: $whatsapp, twitter: $twitter, excluded: $excluded, createdAt: $createdAt, updatedAt: $updatedAt)';
	}

	factory ProducerUser.fromJson(Map<String, dynamic> json) => ProducerUser(
				id: json['id'] as int?,
				user: json['user'] as int?,
				corporateName: json['corporateName'] as String?,
				fantasyName: json['fantasyName'] as String?,
				cnpj: json['cnpj'] as String?,
				description: json['description'] as String?,
				location: json['location'] as String?,
				imgLogo: json['imgLogo'] as String?,
				phone: json['phone'] as String?,
				address: json['address'] as int?,
				facebook: json['facebook'] as String?,
				instagram: json['instagram'] as String?,
				whatsapp: json['whatsapp'] as String?,
				twitter: json['twitter'] as String?,
				excluded: json['excluded'] as int?,
				createdAt: json['createdAt'] as String?,
				updatedAt: json['updatedAt'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user': user,
				'corporateName': corporateName,
				'fantasyName': fantasyName,
				'cnpj': cnpj,
				'description': description,
				'location': location,
				'imgLogo': imgLogo,
				'phone': phone,
				'address': address,
				'facebook': facebook,
				'instagram': instagram,
				'whatsapp': whatsapp,
				'twitter': twitter,
				'excluded': excluded,
				'createdAt': createdAt,
				'updatedAt': updatedAt,
			};

		ProducerUser copyWith({
		int? id,
		int? user,
		String? corporateName,
		String? fantasyName,
		String? cnpj,
		String? description,
		String? location,
		String? imgLogo,
		String? phone,
		int? address,
		String? facebook,
		String? instagram,
		String? whatsapp,
		String? twitter,
		int? excluded,
		String? createdAt,
		String? updatedAt,
	}) {
		return ProducerUser(
			id: id ?? this.id,
			user: user ?? this.user,
			corporateName: corporateName ?? this.corporateName,
			fantasyName: fantasyName ?? this.fantasyName,
			cnpj: cnpj ?? this.cnpj,
			description: description ?? this.description,
			location: location ?? this.location,
			imgLogo: imgLogo ?? this.imgLogo,
			phone: phone ?? this.phone,
			address: address ?? this.address,
			facebook: facebook ?? this.facebook,
			instagram: instagram ?? this.instagram,
			whatsapp: whatsapp ?? this.whatsapp,
			twitter: twitter ?? this.twitter,
			excluded: excluded ?? this.excluded,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}
}

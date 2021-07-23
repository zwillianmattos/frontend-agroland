class ProductSellPhotos {
	int? id;
	int? productId;
	String? imgPath;
	dynamic description;
	int? excluded;
	String? createdAt;
	String? updatedAt;

	ProductSellPhotos({
		this.id, 
		this.productId, 
		this.imgPath, 
		this.description, 
		this.excluded, 
		this.createdAt, 
		this.updatedAt, 
	});

	@override
	String toString() {
		return 'ProductSellPhotos(id: $id, productId: $productId, imgPath: $imgPath, description: $description, excluded: $excluded, createdAt: $createdAt, updatedAt: $updatedAt)';
	}

	factory ProductSellPhotos.fromJson(Map<String, dynamic> json) => ProductSellPhotos(
				id: json['id'] as int?,
				productId: json['productId'] as int?,
				imgPath: json['imgPath'] as String?,
				description: json['description'],
				excluded: json['excluded'] as int?,
				createdAt: json['createdAt'] as String?,
				updatedAt: json['updatedAt'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'productId': productId,
				'imgPath': imgPath,
				'description': description,
				'excluded': excluded,
				'createdAt': createdAt,
				'updatedAt': updatedAt,
			};

		ProductSellPhotos copyWith({
		int? id,
		int? productId,
		String? imgPath,
		dynamic description,
		int? excluded,
		String? createdAt,
		String? updatedAt,
	}) {
		return ProductSellPhotos(
			id: id ?? this.id,
			productId: productId ?? this.productId,
			imgPath: imgPath ?? this.imgPath,
			description: description ?? this.description,
			excluded: excluded ?? this.excluded,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}
}

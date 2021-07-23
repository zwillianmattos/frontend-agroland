class ProductSellCategories {
	int? id;
	int? productId;
	String? description;
	int? excluded;
	String? createdAt;
	String? updatedAt;

	ProductSellCategories({
		this.id, 
		this.productId, 
		this.description, 
		this.excluded, 
		this.createdAt, 
		this.updatedAt, 
	});

	@override
	String toString() {
		return 'ProductSellCategories(id: $id, productId: $productId, description: $description, excluded: $excluded, createdAt: $createdAt, updatedAt: $updatedAt)';
	}

	factory ProductSellCategories.fromJson(Map<String, dynamic> json) => ProductSellCategories(
				id: json['id'] as int?,
				productId: json['productId'] as int?,
				description: json['description'] as String?,
				excluded: json['excluded'] as int?,
				createdAt: json['createdAt'] as String?,
				updatedAt: json['updatedAt'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'productId': productId,
				'description': description,
				'excluded': excluded,
				'createdAt': createdAt,
				'updatedAt': updatedAt,
			};

		ProductSellCategories copyWith({
		int? id,
		int? productId,
		String? description,
		int? excluded,
		String? createdAt,
		String? updatedAt,
	}) {
		return ProductSellCategories(
			id: id ?? this.id,
			productId: productId ?? this.productId,
			description: description ?? this.description,
			excluded: excluded ?? this.excluded,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}
}

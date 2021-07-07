class AcoesData {
  String? city;
  double? price;

  AcoesData({this.city, this.price});

  @override
  String toString() => 'Data(city: $city, price: $price)';

  factory AcoesData.fromJson(Map<String, dynamic> json) => AcoesData(
        city: json['city'] as String?,
        price: json['price'] is int ? json['price'].toDouble() : json['price'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'price': price,
      };

  AcoesData copyWith({
    String? city,
    double? price,
  }) {
    return AcoesData(
      city: city ?? this.city,
      price: price ?? this.price,
    );
  }
}

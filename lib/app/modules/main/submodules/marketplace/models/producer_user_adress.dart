class ProducerUserAddress {
  String? address;
  String? number;
  String? district;
  String? state;
  String? city;
  String? zipCode;
  String? reference;

  ProducerUserAddress(
      {this.address,
      this.number,
      this.district,
      this.state,
      this.city,
      this.zipCode,
      this.reference});

  factory ProducerUserAddress.fromJson(Map<String, dynamic> json) =>
      ProducerUserAddress(
        address: json['address'] as String?,
        number: json['number'] as String?,
        district: json['district'] as String?,
        state: json['state'] as String?,
        city: json['city'] as String?,
        zipCode: json['zip_code'] as String?,
        reference: json['reference'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'number': number,
        'district': district,
        'state': state,
        'city': city,
        'zip_code': zipCode,
        'reference': reference,
      };

  ProducerUserAddress copyWith({
    String? address,
    String? number,
    String? district,
    String? state,
    String? city,
    String? zipCode,
    String? reference,
  }) {
    return ProducerUserAddress(
      address: address ?? this.address,
      number: number ?? this.number,
      district: district ?? this.district,
      state: state ?? this.state,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      reference: reference ?? this.reference,
    );
  }
}

import 'producer_user.dart';
import 'product_categories.dart';
import 'product_sell_photos.dart';

class ProductSell {
  int? id;
  String? title;
  String? price;
  String? description;
  int? formaComercializacao;
  String? formaComercializacaoDescricao;
  ProducerUser? producerUser;
  List<ProductCategories>? productCategories;
  List<ProductSellPhotos>? productSellPhotos;

  ProductSell({
    this.id,
    this.title,
    this.price,
    this.description,
    this.formaComercializacao,
    this.formaComercializacaoDescricao,
    this.producerUser,
    this.productCategories,
    this.productSellPhotos,
  });

  @override
  String toString() {
    return 'ProductSell(id: $id, title: $title, price: $price, description: $description, formaComercializacao: $formaComercializacao, formaComercializacaoDescricao: $formaComercializacaoDescricao, producerUser: $producerUser, productSellCategories: $productCategories, productSellPhotos: $productSellPhotos)';
  }

  factory ProductSell.fromJson(Map<String, dynamic> json) => ProductSell(
        id: json['id'] as int?,
        title: json['title'] as String?,
        price: json['price'] as String?,
        description: json['description'] as String?,
        formaComercializacao: json['forma_comercializacao'] as int?,
        formaComercializacaoDescricao:
            json['forma_comercializacao_descricao'] as String?,
        producerUser: json['ProducerUser'] != null
            ? ProducerUser.fromJson(
                json['ProducerUser'] as Map<String, dynamic>)
            : null,
        productCategories: json['ProductSellCategories'] != null
            ? (json['ProductSellCategories'] as List<dynamic>?)
                ?.map((e) => ProductCategories.fromJson(
                    e['ProductCategory'] as Map<String, dynamic>))
                .toList()
            : null,
        productSellPhotos: json['ProductSellPhotos'] != null
            ? (json['ProductSellPhotos'] as List<dynamic>?)
                ?.map((e) =>
                    ProductSellPhotos.fromJson(e as Map<String, dynamic>))
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'forma_comercializacao': formaComercializacao,
        'forma_comercializacao_descricao': formaComercializacaoDescricao,
        'ProducerUser': producerUser != null ? producerUser!.toJson() : null,
        'product_sell_categories':
            productCategories?.map((e) => e.toJson()).toList(),
        'ProductSellPhotos': productSellPhotos?.map((e) => e.toJson()).toList(),
      };

  ProductSell copyWith({
    int? id,
    String? title,
    String? price,
    String? description,
    int? formaComercializacao,
    String? formaComercializacaoDescricao,
    ProducerUser? producerUser,
    List<ProductCategories>? productCategories,
    List<ProductSellPhotos>? productSellPhotos,
  }) {
    return ProductSell(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      formaComercializacao: formaComercializacao ?? this.formaComercializacao,
      formaComercializacaoDescricao:
          formaComercializacaoDescricao ?? this.formaComercializacaoDescricao,
      producerUser: this.producerUser,
      productCategories: productCategories ?? this.productCategories,
      productSellPhotos: productSellPhotos ?? this.productSellPhotos,
    );
  }
}

class PaginateModel {
  int? currentPage;
  int? totalPages;
  int? totalItems;
  List<dynamic>? items;

  PaginateModel({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.items,
  });

  @override
  String toString() {
    return 'PaginateModel(currentPage: $currentPage, totalPages: $totalPages, totalItems: $totalItems, items: $items)';
  }

  factory PaginateModel.fromJson(Map<String, dynamic> json) => PaginateModel(
        currentPage: json['currentPage'] as int?,
        totalPages: json['totalPages'] as int?,
        totalItems: json['totalItems'] as int?,
        items: json['items'],
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'totalPages': totalPages,
        'totalItems': totalItems,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  PaginateModel copyWith({
    int? currentPage,
    int? totalPages,
    int? totalItems,
    List<dynamic>? items,
  }) {
    return PaginateModel(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }
}

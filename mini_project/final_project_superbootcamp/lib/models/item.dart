class Item {
  final String name;
  int stock;
  int addedCount;
  final double price;

  Item({
    required this.name,
    required this.stock,
    required this.price,
    this.addedCount = 0,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      stock: json['stock'],
      price: json['price'].toDouble(),
    );
  }
}

class Item {
  String id;
  String name;
  int price;
  int stock;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    this.quantity = 0,
  });
}

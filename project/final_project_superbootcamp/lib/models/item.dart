// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String id;
  String name;
  int price;
  int stock;
  String imageUrl;
  String description;
  int quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.description,
    this.quantity = 0,
  });
}

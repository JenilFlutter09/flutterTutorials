class CartItemModel {
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String image;

  CartItemModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> data) {
    return CartItemModel(
      productId: data['productId'],
      name: data['name'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
      image: data['image'],
    );
  }
}

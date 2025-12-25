import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String categoryId;
  final int stock;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.stock,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'categoryId': categoryId,
      'stock': stock,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory ProductModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      name: data['name'],
      description: data['description'],
      price: (data['price'] as num).toDouble(),
      image: data['image'],
      categoryId: data['categoryId'],
      stock: data['stock'],
    );
  }
}

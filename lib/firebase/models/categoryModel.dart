import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.image});

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image};
  }

  factory CategoryModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(id: doc.id, name: data['name'], image: data['image']);
  }
}

class newModelClass {
  final String? id;
  final String? email;
  final String? password;

  newModelClass({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  factory newModelClass.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return newModelClass(
      id: doc.id,
      email: data['email'],
      password: data['password'],
    );
  }
}

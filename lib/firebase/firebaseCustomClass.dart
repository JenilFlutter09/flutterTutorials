import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/cartModel.dart';
import 'models/categoryModel.dart';
import 'models/productModel.dart';


/*
STEPS FOR FIREBASE

CREATE A PROJECT IN FIREBASE

CONNECT THE PROJECT WITH THE ANDROID STUDIO PROJECT


CHECK FOR FLUTTERFIRE VERSION
--> flutterfire --version

CHECK FOR FIREBASE VERSION
-->  firebase --version

IF FIREBASE NOT THERE ADD IT :-
MAC->  brew install firebase-cli // IT WILL TAKE TIME
WINDOWS ->

RECHECK FIREBASE VERSION
--> firebase --version

THEN LOGIN INTO YOUR FIREBASE ACCOUNT USING :-
firebase login

AFTER LOGGED IN SUCCESSFULLY RUN THE COMMAND YOU GET FROM THE FIREBASE CONSOLE
flutterfire configure --project=testingproject-db7ee

SELECT THE PLATFORMS TO INTEGRATE THE FIREBASE PROJECT WITH

AND EVEN FOR CONFIRMATION YOU CAN SEE THE FIREBASE_OPTIONS.DART INSIDE YOUR LIB FOLDER
ADD DEPENDENCIES FOR FIREBASE :-
  firebase_core: ^2.27.0
  cloud_firestore: ^4.15.0


WRITE CUSTOM CLASS FOR PERFORMING OUR TASKS

DESIGN OUR UI TO SEE CHANGES

PERFORM THE CRUD OPERATIONS

*/





class UserModel {
  final String id;
  final String name;
  final int age;
  final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      name: data['name'],
      age: data['age'],
      email: data['email'],
    );
  }
}


class firebaseHelper{

  final FirebaseFirestore dbInstance = FirebaseFirestore.instance;
  static String userString = 'users';
  static String loginString = 'login';
  CollectionReference get userCollectionReference => dbInstance.collection(userString);
  CollectionReference get loginCollectionReference => dbInstance.collection(loginString);

  Future<void> addUser(newModelClass user)async {
    await loginCollectionReference.add(user.toMap());
  }

  Future<List<newModelClass>> fetchUsers() async {
    final data = await loginCollectionReference.get();
    return data.docs.map((doc) => newModelClass.fromDoc(doc)).toList();
  }

  /// DELETE (optional but good)
  Future<void> deleteLoginUser(String id) async {
    await loginCollectionReference.doc(id).delete();
  }

}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference get users => _db.collection('users');

  /// CREATE
  Future<void> addUser(UserModel user) async {
    await users.add(user.toMap());
  }

  /// READ
  Future<List<UserModel>> getUsers() async {
    final snapshot = await users.get();
    return snapshot.docs
        .map((doc) => UserModel.fromDoc(doc))
        .toList();
  }

  /// DELETE (optional but good)
  Future<void> deleteUser(String id) async {
    await users.doc(id).delete();
  }


  /// ---------------- Categories ----------------
  CollectionReference get categories => _db.collection('categories');

  /// CREATE CATEGORY
  Future<void> addCategory(CategoryModel category) async {
    await categories.add(category.toMap());
  }
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await categories.get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromDoc(doc))
        .toList();
  }
  /// DELETE CATEGORY
  Future<void> deleteCategory(String id) async {
    await categories.doc(id).delete();
  }

  /// ---------------- Products ----------------
  CollectionReference get products => _db.collection('products');
  /// CREATE PRODUCT
  Future<void> addProduct(ProductModel product) async {
    await products.add(product.toMap());
  }
  /// READ ALL PRODUCTS
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await products
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromDoc(doc))
        .toList();
  }
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    final snapshot = await products
        .where('categoryId', isEqualTo: categoryId)
        .get();

    return snapshot.docs
        .map((doc) => ProductModel.fromDoc(doc))
        .toList();
  }
  /// DELETE PRODUCT
  Future<void> deleteProduct(String id) async {
    await products.doc(id).delete();
  }

  /// ---------------- Cart ----------------
  CollectionReference cart(String userId) =>
      _db.collection('cart').doc(userId).collection('items');

  Future<void> addToCart(String userId, CartItemModel item) async {
    await cart(userId).doc(item.productId).set(item.toMap());
  }

  // Future<List<CartItemModel>> getCartItems(String userId) async {
  //   final snapshot = await cart(userId).get();
  //   return snapshot.docs
  //       .map((doc) => CartItemModel.fromMap(doc.data()))
  //       .toList();
  // }

  Future<void> deleteCartItem(String userId, String productId) async {
    await cart(userId).doc(productId).delete();
  }
}

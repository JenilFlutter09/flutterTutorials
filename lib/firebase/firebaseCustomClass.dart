import 'package:cloud_firestore/cloud_firestore.dart';


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
}

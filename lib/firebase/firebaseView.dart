import 'package:flutter/material.dart';
import 'package:fluttertutorials/firebase/models/categoryModel.dart';
import 'package:get/get.dart';

import 'firebaseCustomClass.dart';

class FirebaseView extends StatelessWidget {
  FirebaseView({super.key});

  final controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Firestore CRUD",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        elevation: 2,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.users.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.person_off, size: 80, color: Colors.grey),
              SizedBox(height: 12),
              Text(
                "No Users Found",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
         // itemCount: controller.users.length,
          itemCount: controller.loginusers.length,
          itemBuilder: (context, index) {
            final user = controller.loginusers[index];

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(
                    user.email?[0].toUpperCase() ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                title: Text(
                  user.email ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "${user.email}",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                isThreeLine: true,
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () => controller.deleteLoginUser(user.id!),
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAddUserDialog(context),
        icon: const Icon(Icons.add),
        label: const Text("Add User"),
      ),
    );
  }

  // ---------------- ADD USER DIALOG ----------------

  void showAddUserDialog(BuildContext context) {
    final passController = TextEditingController();
    final emailController = TextEditingController();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New User",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passController,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),


              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (passController.text.isEmpty ||
                            emailController.text.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "All fields are required",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }
                        controller.addLoginUser(password: passController.text.trim(), email: emailController.text.trim());
                        // controller.addUser(
                        //   name: passController.text.trim(),
                        //   age: int.parse(ageController.text.trim()),
                        //   email: emailController.text.trim(),
                        // );

                        Get.back();
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class FirebaseController extends GetxController {
  final FirestoreService service = FirestoreService();
  final firebaseHelper fbasehelper = firebaseHelper();
  final users = <UserModel>[].obs;
  final loginusers = <newModelClass>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchUsers();
    fetchLoginUsers();
    super.onInit();
  }

  /// CREATE
  Future<void> addUser({
    required String name,
    required int age,
    required String email,
  }) async {
    await service.addUser(
      UserModel(
        id: '',
        name: name,
        age: age,
        email: email,
      ),
    );

    fetchUsers();
  }

  /// READ
  Future<void> fetchUsers() async {
    isLoading.value = true;
    users.value = await service.getUsers();
    isLoading.value = false;
  }
  /// CREATE
  Future<void> addLoginUser({
    required String password,
    required String email,
  }) async {
    await fbasehelper.addUser(
      newModelClass(
        id: '',
        email: email,
        password: password
      ),
    );

    fetchLoginUsers();
  }

  /// READ
  Future<void> fetchLoginUsers() async {
    isLoading.value = true;
    loginusers.value = await fbasehelper.fetchUsers();
    isLoading.value = false;
  }

  /// DELETE
  Future<void> deleteUser(String id) async {
    await service.deleteUser(id);
    fetchUsers();
  } /// DELETE
  Future<void> deleteLoginUser(String id) async {
    await fbasehelper.deleteLoginUser(id);
    fetchLoginUsers();
  }
}

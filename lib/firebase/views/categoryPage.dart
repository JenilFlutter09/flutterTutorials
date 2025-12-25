import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebaseCustomClass.dart';
import '../models/categoryModel.dart';
//
// class CategoryController extends GetxController {
//   final service = FirestoreService();
//   final categories = <CategoryModel>[].obs;
//
//   @override
//   void onInit() {
//     fetchCategories();
//     super.onInit();
//   }
//
//   void fetchCategories() async {
//     categories.value = await service.getCategories();
//   }
// }
class CategoryController extends GetxController {
  final FirestoreService service = FirestoreService();

  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// CREATE
  Future<void> addCategory({
    required String name,
    required String image,
  }) async {
    await service.addCategory(
      CategoryModel(
        id: '',
        name: name,
        image: image,
      ),
    );
    fetchCategories();
  }

  /// READ
  Future<void> fetchCategories() async {
    isLoading.value = true;
    categories.value = await service.getCategories();
    isLoading.value = false;
  }

  /// DELETE
  Future<void> deleteCategory(String id) async {
    await service.deleteCategory(id);
    fetchCategories();
  }
}

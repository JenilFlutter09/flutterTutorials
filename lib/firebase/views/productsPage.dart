import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firebaseCustomClass.dart';
import '../models/categoryModel.dart';
import '../models/productModel.dart';
class ProductController extends GetxController {
  final FirestoreService service = FirestoreService();

  final products = <ProductModel>[].obs;
  final isLoading = false.obs;

  /// READ
  Future<void> fetchProducts(String categoryId) async {
    isLoading.value = true;
    products.value = await service.getProductsByCategory(categoryId);
    isLoading.value = false;
  }

  /// CREATE
  Future<void> addProduct({
    required String name,
    required double price,
    required String description,
    required String image,
    required String categoryId,
    required int stock,
  }) async {
    await service.addProduct(
      ProductModel(
        id: '',
        name: name,
        price: price,
        description: description,
        image: image,
        categoryId: categoryId,
        stock: stock,
      ),
    );

    fetchProducts(categoryId);
  }

  /// DELETE
  Future<void> deleteProduct(String id, String categoryId) async {
    await service.deleteProduct(id);
    fetchProducts(categoryId);
  }
}


class ProductListView extends StatelessWidget {
  final CategoryModel category;
  final controller = Get.put(ProductController());

  ProductListView({required this.category}) {
    controller.fetchProducts(category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.products.length,
          itemBuilder: (_, index) {
            final product = controller.products[index];
            return ProductCard(product: product);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailView(product: product)),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(product.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("₹${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  final ProductModel product;

  const ProductDetailView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Add to Cart"),
        ),
      ),
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.image, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("₹${product.price}",
                      style: const TextStyle(
                          fontSize: 18, color: Colors.green)),
                  const SizedBox(height: 12),
                  Text(product.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertutorials/firebase/views/productsPage.dart';
import 'package:get/get.dart';

import 'categoryPage.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ShopEasy"), centerTitle: true),
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductListView(category: category));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(category.image, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        category.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addCategory(
          name: "Electronics",
          image: "https://example.com/electronics.png",
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertutorials/apiExample/controller/homePageController.dart';
import 'package:fluttertutorials/apiExample/model/productModel.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(homeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_rounded, color: Colors.white, size: 30),
            SizedBox(width: 5),
            Text(
              'SHOPIFY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          } else if (controller.products.isEmpty) {
            return Container(
              alignment: Alignment.center,
              child: Text('Empty List'),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return customCard(product: product, controller: controller);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await controller.addNewProduct(),
        child: Icon(Icons.add_circle),
      ),
     // bottomNavigationBar: BottomNav,
    );
  }
}

class customCard extends StatelessWidget {
  const customCard({
    super.key,
    required this.product,
    required this.controller,
  });

  final Products product;
  final homeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(product.image ?? "", fit: BoxFit.contain),
          Container(
            decoration: BoxDecoration(color: Colors.blue.shade400),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title ?? 'Product Name',
              overflow: TextOverflow.clip,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () async =>
                  await controller.deleteProduct(product.id ?? 1),
              icon: Icon(Icons.delete),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () async =>
                  await controller.locallySaveId(product.id ?? 101),
              icon: Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}

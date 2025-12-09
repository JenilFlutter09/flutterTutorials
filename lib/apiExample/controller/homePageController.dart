import 'dart:convert';

import 'package:fluttertutorials/apiExample/model/productModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class homeController extends GetxController{
  RxList<Products> products = <Products>[].obs;
 // Rxn<Products> singleProduct = Rxn<Products>();
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchData();
  }
  Future<void> fetchData() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode == 200){
      /// Assign Data to our list
      print("success Fetched");
      List<dynamic> jsonList = jsonDecode(response.body);
      products.value = jsonList.map((e) => Products.fromJson(e)).toList();
    }else{
      print('Error occured :- ${response.statusCode}');
    }
    isLoading.value = false;
  }
  Future<void> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('https://fakestoreapi.com/products/$id'));
    if(response.statusCode == 200){
      /// remove from our list
      print("success deleted");
      products.removeWhere((product) => product.id == id);
      products.refresh();
    }else{
      print('Error occured :- ${response.statusCode}');
    }
  }
}
/*class homeController extends GetxController{

  RxList<Products> products = <Products>[].obs;
  Rxn<Products> singleProduct = Rxn<Products>();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      // Successful response
      print("success Fetched");
      List<dynamic> jsonList = jsonDecode(response.body);
      products.value = jsonList.map((e) => Products.fromJson(e)).toList();
    } else {
      // Handle errors
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  Future<void> addNewProduct() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final bodyData = jsonEncode({
      "id": 0,
      "title": "New Product",
      "price": 99.9,
      "description": "A sample added product",
      "image": "https://i.pravatar.cc",
      "category": "electronics",
    });
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: bodyData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successful response
      print("Product Added Successfully");
      final json = jsonDecode(response.body);
      singleProduct.value = Products.fromJson(json);
    } else {
      // Handle errors
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> deleteProduct(int id) async {
    final url = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.delete(url);
    if(response.statusCode == 200){
      print('Product Deleted Successfully');
      //await fetchData();
      products.removeWhere((product) => product.id == id);
      products.refresh();
    }else{
      print('Error in Deletion');
    }
  }
  Future<void> fetchSingleProduct(String id) async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
      // Successful response
      print("success Fetched");
      singleProduct.value = Products.fromJson(jsonDecode(response.body));
    } else {
      // Handle errors
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}*/


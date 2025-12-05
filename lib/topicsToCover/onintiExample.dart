import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
/// Dashboard
class onInitExample extends StatelessWidget {
  onInitExample({super.key});
  final dashboard_controller = Get.put(dashboardController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200,),
          Expanded(
            child: ExpansionTile(
              title: Text('Categories'),
              children: [
                RefreshIndicator(
                    onRefresh: () async => await dashboard_controller.onRefresh(),
                    child: Obx((){
                      return  ListView.builder(
                          shrinkWrap: true,
                          itemCount: dashboard_controller.items.length,
                          itemBuilder: (context,index){
                            var item = dashboard_controller.items[index];
                            return InkWell(
                                onTap: (){
                                  dashboard_controller.selectedproductId.value = item;
                                  Get.to(()=> productDetailPage());
                                },
                                child: ListTile(
                                  title: Text(item),
                                ));
                          });
                    })
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/// Dashboard List of Options 5 - 7 category
/// Question Page 5 
/// Result Page 
class dashboardController extends GetxController{
  RxString selectedproductId = "".obs;
  RxList items = ["one", "two", "three"].obs;
  RxList<quizElement> quizList = <quizElement>[].obs;
  Future<void> onRefresh()  async {
    print('On Refresh');
    items.refresh();
    items.add('new element');
   // await addNewElement();
    items.refresh();
  }
}
class quizElement {
  int id;
  String question;
  String answer;
  String option1;
  quizElement({required this.id,required this.question,required this.answer, required this.option1});
}
class productDetailPage extends StatelessWidget {
  productDetailPage({super.key});
  final controller = Get.put(productController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment:  Alignment.center,
        child: Text('Index of product ${controller.data.value}'),
      ),
    );
  }
}
class productController extends GetxController{
  final dashboard_controller = Get.find<dashboardController>();
  RxString data = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data.value = dashboard_controller.selectedproductId.value;
  }
}
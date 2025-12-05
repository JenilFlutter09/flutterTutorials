import 'package:flutter/material.dart';
// import 'package:flutter_practice/Common%20Functions/Common_Functions.dart';
import 'package:get/get.dart';

class To_Do_Screen_GetX extends StatefulWidget {
  const To_Do_Screen_GetX({super.key});

  @override
  State<To_Do_Screen_GetX> createState() => _To_Do_ScreenState();
}

class _To_Do_ScreenState extends State<To_Do_Screen_GetX> {
  List<String> todo_items = [];
  TextEditingController task_Controller = Get.put(TextEditingController());

  //Date And Time

  String currentDate = "";
  String currentTime = "";

  void getDateTime() {
    DateTime now = DateTime.now();
    Obx() {
      currentDate = "${now.day} -${now.month}-${now.year}";
      currentTime = "${now.hour}-${now.minute}";
    }
  }

  //Add Item

  void getBottomSheet_AddItem() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextField(
                maxLines: 1,
                controller: task_Controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                  hintText: "Add Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  if (task_Controller.text.isNotEmpty) {
                    Obx() {
                      todo_items.add(task_Controller.text);
                    }

                    task_Controller.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: Common_Functions.GetAppBar(context, "TO DO"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getBottomSheet_AddItem();
          getDateTime();
        },
        child: Icon(Icons.add_circle, size: 40, color: Colors.pink),
      ),
      body: Container(
        height: screen_height,
        width: screen_width,
        child: todo_items.isEmpty
            ? Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: todo_items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  todo_items[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Date ${currentDate}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                Text(
                                  "Time ${currentTime}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Obx() {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.white,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) {
                                          TextEditingController
                                          editingController = Get.put(
                                            TextEditingController(
                                              text: todo_items[index],
                                            ),
                                          );

                                          return Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(
                                                context,
                                              ).viewInsets.bottom,
                                              left: 20,
                                              right: 20,
                                              top: 20,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Update Your Tasks",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Icon(
                                                        Icons.cancel_outlined,
                                                        color: Colors.pink,
                                                        size: 30,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 30),
                                                TextField(
                                                  maxLines: 1,
                                                  controller: editingController,
                                                  textAlign: TextAlign.start,
                                                  cursorColor: Colors.pink,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        task_Controller.text,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 30),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.pink,
                                                      ),
                                                  onPressed: () {
                                                    if (editingController
                                                        .text
                                                        .isNotEmpty) {

                                                        todo_items[index] =
                                                            editingController
                                                                .text;
                                                      editingController.clear();
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  child: Text(
                                                    "Update",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Obx() {
                                      todo_items.removeAt(index);
                                    }
                                  },
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}


/// UI CLass
class todoExample extends StatelessWidget {
  todoExample({super.key});
  final controller = Get.put(todoController());
  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: Common_Functions.GetAppBar(context, "TO DO"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          getBottomSheet_AddItem(context, controller);
          controller.getDateTime();
        },
        child: Icon(Icons.add_circle, size: 40, color: Colors.pink),
      ),
      body: Container(
        height: screen_height,
        width: screen_width,
        child: Obx((){
              if(controller.todo_items.isEmpty){
               return Center(
                  child: Text(
                    "No Data Found",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: controller.todo_items.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.todo_items[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "Date ${controller.currentDate}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                Text(
                                  "Time ${controller.currentTime}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) {
                                        controller.task_Controller.text = controller.todo_items[index];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(
                                              context,
                                            ).viewInsets.bottom,
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  "Update Your Tasks",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.cancel_outlined,
                                                      color: Colors.pink,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30),
                                              TextField(
                                                maxLines: 1,
                                                controller: controller.task_Controller,
                                                textAlign: TextAlign.start,
                                                cursorColor: Colors.pink,
                                                decoration: InputDecoration(
                                                  hintText: controller
                                                      .task_Controller
                                                      .text,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                      10,
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              ElevatedButton(
                                                style:
                                                ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.pink,
                                                ),
                                                onPressed: ()=> controller.updateItem(index),
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () =>
                                      controller.todo_items.removeAt(index),
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
        })
      ),
    );
  }

  void getBottomSheet_AddItem(BuildContext context, todoController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Tasks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.pink,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextField(
                maxLines: 1,
                controller: controller.task_Controller,
                textAlign: TextAlign.start,
                cursorColor: Colors.pink,
                decoration: InputDecoration(
                  hintText: "Add Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  if (controller.task_Controller.text.isNotEmpty) {
                    controller.todo_items.add(controller.task_Controller.text);
                    controller.task_Controller.clear();
                    // Navigator.pop(context);
                    Get.back();
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
/// Logical Class
class todoController extends GetxController {
  RxList<String> todo_items = <String>[].obs;
  TextEditingController task_Controller = Get.put(TextEditingController());

  String currentDate = "";
  String currentTime = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    /// api get
    /// one
    /// two
    /// three
    /// initialization of data
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void getDateTime() {
    DateTime now = DateTime.now();
    currentDate = "${now.day} -${now.month}-${now.year}";
    currentTime = "${now.hour}-${now.minute}";
  }
  void updateItem(int index){
    if (task_Controller
        .text
        .isNotEmpty) {
     
          todo_items[index] =
         task_Controller
              .text;

      task_Controller.clear();
      Get.back();
    }
  }
}

class empty extends StatelessWidget {
  const empty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

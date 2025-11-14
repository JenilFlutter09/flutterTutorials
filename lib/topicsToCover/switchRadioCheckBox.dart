import 'package:flutter/material.dart';

class srcExample extends StatefulWidget {
  const srcExample({super.key});

  @override
  State<srcExample> createState() => _srcExampleState();
}

class _srcExampleState extends State<srcExample> {
  final radioList = ['one', 'two', 'three'];
  List<checkBoxClass> checkBoxClassList = [
    checkBoxClass(name: 'apple', value: false),
    checkBoxClass(name: 'banana', value: false),
    checkBoxClass(name: 'cherry', value: false),
  ];
  late String selectedRadio = radioList.first;
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final todayDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SRC Example',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                'Date = ${todayDate.toString().split(' ')[0]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('-Switch-'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('-OFF-'),
                      Switch(

                        value: switchValue,
                        onChanged: (bool value) {
                          setState(()=>switchValue = value);

                        },
                      ),
                      Text('-ON-'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('-Radio-'),
                  RadioGroup<String>(
                    groupValue: selectedRadio,
                    onChanged: (String? value) {
                      setState(() => selectedRadio = value!);
                    },
                    child: Column(
                      children: [
                        RadioListTile(
                          value: radioList[0],
                          title: Text(radioList[0]),
                        ),
                        RadioListTile(
                          value: radioList[1],
                          title: Text(radioList[1]),
                        ),
                        RadioListTile(
                          value: radioList[2],
                          title: Text(radioList[2]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Text('-CheckBox-'),
                 Row(
                   children: [
                     Checkbox(value: checkBoxClassList[0].value, onChanged: (bool? value){
                       setState(() {
                         checkBoxClassList[0].value = value!;
                       });
                     }),
                     Text(checkBoxClassList[0].name),
                   ],
                 ),
                  Row(
                    children: [
                      Checkbox(value: checkBoxClassList[1].value, onChanged: (bool? value){
                        setState(() {
                          checkBoxClassList[1].value = value!;
                        });
                      }),
                      Text(checkBoxClassList[1].name),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: checkBoxClassList[2].value, onChanged: (bool? value){
                        setState(() {
                          checkBoxClassList[2].value = value!;
                        });
                      }),
                      Text(checkBoxClassList[2].name),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class checkBoxClass {
  final String name;
  bool value ;
  checkBoxClass({required this.name,required this.value});
}
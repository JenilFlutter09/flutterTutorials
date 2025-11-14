import 'package:flutter/material.dart';

class navigationExample extends StatelessWidget {
  const navigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jenil Shah'),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => setStateExample()),
                // );

                Navigator.pushNamed(
                  context,
                  '/setStateExample',
                  arguments: 'Hello from Apeksha!',
                );
              },
              child: Text('Go TO Next Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Pop this page'),
            ),
          ],
        ),
      ),
    );
  }
}

class setStateExample extends StatefulWidget {
  const setStateExample({super.key});

  @override
  State<setStateExample> createState() => _setStateExampleState();
}

class _setStateExampleState extends State<setStateExample> {
  int? value;
  // TextEditingController user_email = TextEditingController();
  // TextEditingController user_password = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePassword = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = 0;
  }

  @override
  void didUpdateWidget(covariant setStateExample oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    // user_email.dispose();
    // user_password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String args = ModalRoute.of(context)?.settings.arguments as String;
    final _formKey = GlobalKey<FormState>();
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        //leading: Text('Today'),
        centerTitle: true,
        title: Text(
          'Login Screen',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,

        /* child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context,index){
          return ListTile(
            title: Text(index.toString()),
          );
        })*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),

                  //   labelText: 'Email',
                  //   floatingLabelAlignment: FloatingLabelAlignment.start,
                  //   floatingLabelBehavior: FloatingLabelBehavior.never
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: password,
                obscureText: hidePassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  suffix: GestureDetector(
                      onTap: (){
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      child: Icon(Icons.remove_red_eye))
                  //   labelText: 'Email',
                  //   floatingLabelAlignment: FloatingLabelAlignment.start,
                  //   floatingLabelBehavior: FloatingLabelBehavior.never
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              print(email.text);
            }, child: Text('Login')),
             //formExample(formKey: _formKey),
          ],
        ),
      ),
    );
  }
}

/*
class formExample extends StatelessWidget {
  const formExample({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
     key: _formKey,
     child: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(10),
           child: TextFormField(
             controller: email,
             keyboardType: TextInputType.emailAddress,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.blue),
               ),
               prefixIcon: Icon(Icons.person),
               hintText: 'User Email',
             ),
             validator: (value){
               if(value == null || value.isEmpty){
                 return 'Please enter Email';
               }else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                 return 'Enter a valid email';
               }else{
                 return null;
               }
             },
             autovalidateMode: AutovalidateMode.onUnfocus,
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(10),
           child: TextFormField(
             controller: user_password,
             keyboardType: TextInputType.emailAddress,
             obscureText: true,
             obscuringCharacter: '*',
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.blue),
               ),
               prefixIcon: Icon(Icons.person),

               hintText: 'Password',
             ),
             validator: (value){
               if(value == null || value.isEmpty){
                 return 'Please enter Email';
               }else  if (value.length < 6) {
                 return 'Password must be at least 6 characters';
               }
               return null;
             },
           ),
         ),
       ],
     ),
                );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:svg_image/svg_image.dart';



class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController conform_password = TextEditingController();
    TextEditingController phonenum = TextEditingController();

    String strPassword, strConform_Password;

    void checkPassword() {
      strPassword = password.text;
      strConform_Password = conform_password.text;

      setState(() {
        if (strPassword.isEmpty | strConform_Password.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password & Conform Password are required")),
          );
        } else if (strPassword == strConform_Password) {
          Navigator.pushNamed(context, '/Password', arguments: strPassword);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Account Created Successfully")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Something went wrong")));
        }
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                    child: Image.asset('assets/images/newImg.jpg')

                  // child: SvgImage(
                  //   'assets/images/background.svg',
                  //   type: PathType.assets,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Divider(color: Colors.pink, thickness: 2),
                ),
                SizedBox(height: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: email,
                      maxLines: 1,
                      cursorColor: Colors.pink,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "ape@gmail.com",
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.email_outlined),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "Phone no. ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: phonenum,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        // FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        hintText: "9864537564",

                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.send_to_mobile_outlined),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    Text(
                      "Password ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: password,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.lock_clock),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        /*suffix: GestureDetector(onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });

                              }),*/

                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Conform Password ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      controller: conform_password,
                      inputFormatters: [LengthLimitingTextInputFormatter(8)],

                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      cursorColor: Colors.pink,
                      decoration: InputDecoration(
                        hintText: "Conform Password",
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Icon(Icons.lock_clock),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),

                        /*suffix: GestureDetector(onTap: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });

                              }),*/
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                  ],
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(
                    onPressed: () {
                      checkPassword();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      "Create Account ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "Already have an Account ? ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => SignIn()),
                        // );
                      },
                      child: Text(
                        textAlign: TextAlign.start,
                        "Login ",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  // const SignIn({super.key,required this.password});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String strGetPassword =
    ModalRoute.of(context)!.settings.arguments as String;
    String strPassword;
    void login() {
      strPassword = password.text;

      if (strPassword == strGetPassword) {
        Navigator.pushNamed(context, '/display', arguments: "Welcome");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Success")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(

            children: [
              SizedBox(height:500,child: Image.asset('assets/images/back.png',width: screenWidth,fit: BoxFit.fitWidth,),),
              Column(
                children: [
                  SizedBox(height: 420,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Divider(color: Colors.pink, thickness: 2),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Email ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: email,
                          maxLines: 1,
                          cursorColor: Colors.pink,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "ape@gmail.com",
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(Icons.email_outlined),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          "Password ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        TextField(
                          controller: password,
                          inputFormatters: [LengthLimitingTextInputFormatter(8)],
                          obscureText: hidePassword,
                          obscuringCharacter: '*',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.pink,
                          decoration: InputDecoration(
                            hintText: "Password",
                           contentPadding: EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(Icons.lock_clock),
                            suffix: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    print(hidePassword);
                                    hidePassword = !hidePassword;
                                    print(hidePassword);
                                  });
                                },
                                child: Icon(Icons.remove_red_eye)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.adjust_rounded,
                                    //  color: AppColors.lineColor,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Remember me ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                "Forgot password?",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  //  color: AppColors.lineColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text(
                              "Login ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Don’t have an Account ? ",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                textAlign: TextAlign.start,
                                "Sign up ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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

class definedColors {
  static Color liked = Colors.red;
}
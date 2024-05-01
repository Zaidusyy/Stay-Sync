import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/Forms/Register.dart';
import 'package:uu_hostel_management/home.dart';





class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  login(){
    print('step 1');
    FirebaseAuth auth=FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email.text, password: pass.text).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
      print('success');
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  bool isvisible=true;
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: uuLightRed,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topCenter,
              begin: Alignment.bottomRight,

              colors: logingradiant),
        ),
        height: double.infinity,
        width: double.infinity,

        //TODO adjust height and width of internal container

        padding: EdgeInsets.only(top: 80, bottom: 30, left: 10, right: 10),
        // padding: EdgeInsets.symmetric(horizontal: 70,vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  'assets/uubannerpng.png',
                ),
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/hostel.png'),
                  height: 180,
                ),
              ),
              Container(
                // constraints: BoxConstraints(minHeight: 100,minWidth: 100,maxHeight: 550,maxWidth: 350),
                margin: EdgeInsets.all(10),
                padding:
                EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: uuWhite,
                  border: Border.all(color: uuLightRed, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyInputField(
                      keyboardtype: TextInputType.emailAddress,
                      label: 'Email',
                      controller: email,
                      prefix: Icon(
                        Icons.email_outlined,
                        color: uuBlue,
                      ),
                    ),
                    MyInputField(
                      keyboardtype: TextInputType.visiblePassword,
                      ispassword: isvisible,
                      label: 'Password',
                      controller: pass,
                      prefix: Icon(
                        Icons.lock_outline,
                        color: uuBlue,
                      ),
                      suffix: InkWell(onTap: (){
                        isvisible=!isvisible;
                        setState(() {
                        });
                      },
                        child: Icon((isvisible)?
                          Icons.visibility_outlined:Icons.visibility_off_outlined,
                          color: uuBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                  color: uuBlue,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dashed),
                            ))
                      ],
                    ),
                    Roundbutton(
                      name: 'Login',
                      onTap: () {
                        if(email.text.isNotEmpty && pass.text.isNotEmpty){
                          login();
                        }


                      },
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have Account ? ',
                          style: TextStyle(color: uuBlue),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: uuRed, fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


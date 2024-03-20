import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String selectedFloor = 'Preferred Floor';
  String selectedRoomType = 'Room Type';

  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: logingradiant,
          end: Alignment.topCenter,
          begin: Alignment.bottomRight,
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/uubannerpng.png',
                ),
                height: 60,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: Image(
              //     image: AssetImage('assets/hostel.png'),
              //     height: 180,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: uuLightRed, width: 2)),
                child: Column(
                  children: [
                    MyInputField(
                      label: 'Name',
                      prefix: Icon(
                        Icons.person_outline,
                        color: uuBlue,
                      ),
                    ),
                    MyInputField(
                      label: 'Student ID',
                      prefix: Icon(
                        Icons.person_pin_outlined,
                        color: uuBlue,
                      ),
                    ),
                    MyInputField(
                      keyboardtype: TextInputType.emailAddress,
                      label: 'Email',
                      prefix: Icon(
                        Icons.email_outlined,
                        color: uuBlue,
                      ),
                    ),
                    MyInputField(
                      label: 'Payment ID',
                      prefix: Icon(
                        Icons.payment,
                        color: uuBlue,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          top: 20, right: 10, left: 10,),
                      padding: EdgeInsets.only(
                          top: 6, bottom: 6, left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: uuBlue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: uuWhite),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: selectedFloor,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedFloor = newValue!;
                          });
                        },
                        icon: Icon(
                          Icons.business,
                          color: uuBlue,
                        ),
                        items: <String>['Preferred Floor',
                          'Ground Floor',
                          'First Floor',
                          'Second Floor',
                          'Third Floor'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: uuBlue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          top: 20, right: 10, left: 10,),
                      padding: EdgeInsets.only(
                          top: 6, bottom: 6, left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: uuBlue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: uuWhite),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        isExpanded: true,
                        value: selectedRoomType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRoomType = newValue!;
                          });
                        },
                        icon: Icon(
                          Icons.bedroom_parent_outlined,
                          color: uuBlue,
                        ),
                        items: <String>[
                          'Room Type',
                          '2 Seater AC',
                          '3 Seater AC',
                          '2 Seater',
                          '3 Seater'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: uuBlue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    MyInputField(
                      keyboardtype: TextInputType.visiblePassword,
                      //   ispassword: isvisible,
                      ispassword: true,
                      label: 'Password',
                      prefix: Icon(
                        Icons.lock_outline,
                        color: uuBlue,
                      ),
                    ),
                    MyInputField(
                      keyboardtype: TextInputType.visiblePassword,
                      ispassword: isvisible,
                      label: 'Confirm Password',
                      prefix: Icon(
                        Icons.lock_outline,
                        color: uuBlue,
                      ),
                      suffix: InkWell(
                        onTap: () {
                          isvisible = !isvisible;
                          setState(() {});
                        },
                        child: Icon(
                          (isvisible)
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: uuBlue,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Roundbutton(name: 'Signup', onTap: (){}),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have Account ? ',
                          style: TextStyle(color: uuBlue),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: uuRed, fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}

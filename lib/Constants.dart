import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/AntiRagging.dart';
import 'package:uu_hostel_management/Forms/Login.dart';
import 'package:uu_hostel_management/HelpAndComplaint.dart';
import 'package:uu_hostel_management/Medicalhelp.dart';
import 'package:uu_hostel_management/home.dart';

import 'Drawer_Screens/Aboutus.dart';

const uuBlue = Color(0xFF004080);
const uuRed = Color(0xFFA5123E);
const uuLightBlue = Color(0xFFAAD4FF);
const uuLightRed = Color(0xFFFFE5E6);
const uuWhite = Color(0xFFEFEFEF);
const enabledblue = Color(0xFF2196F3);

const List<Color> logingradiant = [
  uuBlue,
  uuLightBlue,
  uuLightRed,
  uuWhite,
  uuLightBlue
];
const List<Color> lightgradiant = [uuLightBlue, uuWhite, uuLightRed];

final tabbartextstyle =
    TextStyle(color: uuBlue, fontWeight: FontWeight.bold, fontSize: 20);

class Roundbutton extends StatelessWidget {
  String name;
  final message;
  final color;
  final VoidCallback onTap;

  Roundbutton(
      {super.key,
      required this.name,
      this.message = null,
      required this.onTap,
      this.color = uuBlue});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        // height: 60,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: color),
        padding: const EdgeInsets.all(10),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  final label,
      prefix,
      suffix,
      controller,
      keyboardtype,
      ispassword,
      enabled,
      value,
      maxline,
      maxlength;
  MyInputField(
      {super.key,
      required this.label,
      this.prefix = null,
      this.suffix = null,
      this.keyboardtype = TextInputType.text,
      this.controller = null,
      this.ispassword = false,
      this.enabled = true,
      this.value = null,
      this.maxline = 1,
      this.maxlength = null});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        enabled: enabled,
        maxLength: maxlength,
        maxLines: maxline,
        obscureText: ispassword,
        controller: controller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          filled: true,
          fillColor: uuWhite,
          prefixIcon: prefix,
          suffixIcon: suffix,
          label: Text(
            (value == null) ? label : value,
            style: TextStyle(color: uuBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: uuBlue),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: uuBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: enabledblue),
          ),
        ),
      ),
    );
  }
}

class Drawermenue extends StatelessWidget {
  var icon;
  var name, navigate, contxt;
  Drawermenue(
      {super.key,
      this.icon = null,
      required this.name,
      this.navigate = null,
      this.contxt});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(
          icon,
          color: uuBlue,
          size: 27,
        ),
        title: Text(
          name,
          style: TextStyle(
              color: uuBlue, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        onTap: () {
          Navigator.of(context).pop();
          print(navigate);
          if (navigate.toString() != contxt.toString()) {
            if (navigate.toString() == 'home') {
              Navigator.pop(context);
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navigate));
            }
          }
        },
      ),
    );
  }
}

class Roundmenu extends StatelessWidget {
  var navigate, icon, name, image;
  double fontsize;

  Roundmenu(
      {super.key,
      required this.name,
      required this.icon,
      required this.navigate,
      this.image = null,
      this.fontsize = 15});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 90,
          margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [uuLightBlue, uuWhite, uuLightRed],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: uuLightBlue, width: 2),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              if (navigate != null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => navigate));
              }
            },
            child: Center(
              // child: ListTile(
              //   horizontalTitleGap: 1,
              //   titleAlignment: ListTileTitleAlignment.center,
              //   leading: Icon(
              //     icon,
              //     color: uuBlue,
              //     size: 30,
              //   ),
              //   title: Text(
              //     name,
              //     style: TextStyle(
              //       color: uuBlue,
              //       fontSize: fontsize,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     textAlign: TextAlign.start,
              //   ),
              //   trailing: (image == null)
              //       ? Icon(
              //           Icons.arrow_forward_ios_outlined,
              //           color: uuBlue,
              //           size: 25,
              //         )
              //       : Image(image: image),
              // ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    icon,
                    color: uuBlue,
                    size: 30,
                  ),

              Text(
                    name,
                    style: TextStyle(
                      color: uuBlue,
                      fontSize: fontsize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
              Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: uuBlue,
                          size: 25,
                        )

                ],
              ),
            ),
          )),
    );
  }
}

class MyDrawer extends StatelessWidget {
  var contxt;
  MyDrawer({super.key, this.contxt});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: uuLightBlue,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: logingradiant,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 30,
                        maxRadius: 40,
                        backgroundColor: uuBlue,
                        backgroundImage: NetworkImage(
                            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjH3asamCIge-3u65qhVVMg5OpC-_xrSV_9LDQcn8Mc5ZGKVmDDDZwNl9Gx2mpSj_oKmx9vZMyxVMe0dTTT1TIpAylkUsJ_p0feDwHuOipsnZx-lSPqqShmhVKiaTSRe4GSKMwijOwyJtVyndpb8LQnITkzbtoNmSUqSzOAvXf6OmG3yRw/s220/profile.jpeg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Mohd Zaid Sayyed',
                            style: TextStyle(color: uuBlue, fontSize: 15),
                          ),
                          Text(
                            'UU222010074',
                            style: TextStyle(color: uuBlue, fontSize: 15),
                          ),
                          InkWell(
                            splashColor: uuLightBlue,
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  color: uuBlue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Drawermenue(
                name: 'Home',
                icon: Icons.home_outlined,
                navigate: home(),
                contxt: contxt,
              ),
              Drawermenue(
                name: 'Time Table',
                icon: Icons.schedule,
              ),
              Drawermenue(
                name: 'Medical Help',
                icon: Icons.medical_services_outlined,
                navigate: Medicalhelp(),
              ),
              Drawermenue(
                name: 'Anti Ragging',
                icon: Icons.phone,
                navigate: AntiRagging(),
              ),
              Drawermenue(
                name: 'Help & Support',
                icon: Icons.help_outline,
                navigate: HelpAndComplaint(),
                contxt: context,
              ),
              Drawermenue(
                name: 'About Us',
                icon: Icons.info_outline,
                navigate: Aboutus(),
                contxt: contxt,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFieldContainer extends StatelessWidget {
  final VoidCallback ontap;
  final label, prefix, suffix, value;

  const MyTextFieldContainer(
      {super.key,
      required this.ontap,
      required this.label,
      this.prefix = null,
      this.suffix = null,
      this.value = null});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: MyInputField(
        label: label,
        prefix: prefix,
        suffix: suffix,
        enabled: false,
        value: value,
      ),
      onTap: ontap,
    );
  }
}

class AboutDoctor extends StatelessWidget {
  final image, name, profile, pricingtext;
  bool widthInfinity;
  AboutDoctor(
      {super.key,
        required this.image,
        required this.name,
        required this.profile,
        this.widthInfinity = false,
        this.pricingtext = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.indigo.shade100),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      height: (widthInfinity)?600:500,
      width: 400,
      child: Column(
        children: [
          Container(
            height: 320,
            width: (widthInfinity) ? double.infinity : 300,
            padding: EdgeInsets.only(bottom: 20, left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover)),
            child: (!widthInfinity)?null:Container(
              width: (pricingtext[0] == 'F') ? 90 : 180,
              // margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: (widthInfinity) ? uuBlue : null,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.calendar_badge_minus,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    pricingtext,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            alignment: Alignment.bottomLeft,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: uuBlue),
            textAlign: TextAlign.center,
          ),
          Text(
            profile,
            style: TextStyle(fontSize: (widthInfinity) ? 15 : 20),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 100, right: 100),
            child: (widthInfinity)
                ? InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.indigo.shade500,
                      blurRadius: 5,
                      spreadRadius: 2)
                ], color: uuBlue, borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Subscribe',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                alignment: Alignment.bottomCenter,),)
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    child: Icon(
                      Icons.facebook,
                      color: uuBlue,
                      size: 30,
                    ),
                    radius: 25,
                    backgroundColor: uuLightBlue,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    child: Icon(
                      Icons.phone,
                      color: uuBlue,
                      size: 30,
                    ),
                    radius: 25,
                    backgroundColor: uuLightBlue,
                  ),
                ),InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    child: Icon(
                      Icons.wechat,
                      color: uuBlue,
                      size: 30,
                    ),
                    radius: 25,
                    backgroundColor: uuLightBlue,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
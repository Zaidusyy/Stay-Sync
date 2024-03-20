import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
const List<Color> lightgradiant=[uuLightBlue, uuWhite, uuLightRed];


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
  final label, prefix, suffix, controller, keyboardtype, ispassword;
  MyInputField(
      {super.key,
      required this.label,
      this.prefix = null,
      this.suffix = null,
      this.keyboardtype = TextInputType.text,
      this.controller = null,
      this.ispassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: TextFormField(
        obscureText: ispassword,
        controller: controller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          filled: true,
          fillColor: uuWhite,
          prefixIcon: prefix,
          suffixIcon: suffix,
          label: Text(
            label,
            style: TextStyle(color: uuBlue),
          ),
          enabledBorder: OutlineInputBorder(
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
          margin: EdgeInsets.only(top: 10, bottom: 10,left: 5,right: 5),
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
            onTap: (){
              if(navigate!=null) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => navigate));
              }
            },
            child: Center(
              child: ListTile(
                horizontalTitleGap: 1,
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(
                  icon,
                  color: uuBlue,
                  size: 30,
                ),
                title: Text(
                  name,
                  style: TextStyle(
                      color: uuBlue,
                      fontSize: fontsize,
                      fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.start,
                ),

                trailing: (image == null)
                    ? Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: uuBlue,
                        size: 25,
                      )
                    : Image(image: image),
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
                          onTap: () {},
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
            ),
            Drawermenue(
              name: 'Anti Ragging',
              icon: Icons.phone,
            ),
            Drawermenue(
              name: 'Help & Support',
              icon: Icons.help_outline,
            ),
            Drawermenue(
              name: 'Feedback',
              icon: Icons.feedback_outlined,
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
    );
  }
}

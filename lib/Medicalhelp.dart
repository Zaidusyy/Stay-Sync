
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Medicalhelp extends StatelessWidget {
  const Medicalhelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Medical Help',
          style: TextStyle(fontWeight: FontWeight.bold, color: uuBlue),
        ),
        backgroundColor: uuWhite,
        centerTitle: true,
      ),
      drawer: MyDrawer(contxt: context,),
      backgroundColor: uuWhite,
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: lightgradiant,begin: Alignment.topLeft,end: Alignment.bottomRight),),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'We are open and Welcoming Patients',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: uuBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image(
                  image: NetworkImage('https://i.pinimg.com/originals/1b/0a/41/1b0a41cf2132a34bf05a9b4dee30c1a6.png'),
                  height: 450,
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 30,right: 30,bottom: 30,top: 20),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: uuLightBlue,
                        borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(color: uuLightBlue,blurRadius: 10)]),
                    child: Center(
                        child: Text(
                          'Contact us',
                          style: TextStyle(fontSize: 25, color: uuBlue,fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                Center(child: ListTile(leading: Icon(CupertinoIcons.clock,color: uuBlue,),title: Text('Monday - Saturday\n9:00am - 10:00pm',style: TextStyle(fontWeight: FontWeight.w600),),textColor: uuBlue,)),
                Center(child: ListTile(leading: Icon(Icons.location_on_outlined,color: uuBlue,),title: Text('United Medicity,\nRawatPur, Prayagraj',style: TextStyle(fontWeight: FontWeight.w600)),textColor: uuBlue,)),
                Center(child: ListTile(leading: Icon(CupertinoIcons.phone,color:uuBlue,),title: Text('+91 9920619416\n+91 9992061543',style: TextStyle(fontWeight: FontWeight.w600)),textColor: uuBlue,)),
                Center(child: ListTile(leading: Icon(Icons.email_outlined ,color:uuBlue,),title: Text('uniteduniversity@gmail.com\nunitedmedicity@gmail.com',style: TextStyle(fontWeight: FontWeight.w600)),textColor: uuBlue,)),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

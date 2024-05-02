import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isedit=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      backgroundColor: uuWhite,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          isedit=!isedit;
          setState(() {
          });
        }, icon: Icon((isedit)?Icons.save_as_outlined:Icons.edit_note_outlined,color: uuBlue,size: 30,),splashColor: Colors.transparent,)],
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: uuBlue),
        ),
        backgroundColor: uuWhite,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: lightgradiant,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:
                EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
                height: 150,
                decoration: BoxDecoration(
                    border:
                    Border.all(color: uuBlue.withOpacity(0.7), width: 4),
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjH3asamCIge-3u65qhVVMg5OpC-_xrSV_9LDQcn8Mc5ZGKVmDDDZwNl9Gx2mpSj_oKmx9vZMyxVMe0dTTT1TIpAylkUsJ_p0feDwHuOipsnZx-lSPqqShmhVKiaTSRe4GSKMwijOwyJtVyndpb8LQnITkzbtoNmSUqSzOAvXf6OmG3yRw/s220/profile.jpeg'),
                        fit: BoxFit.contain)),
              ),
              MyInputField(prefix: Icon(Icons.person_outline,color: uuBlue,),label: 'Mohd Zaid Sayyed',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.person_pin_outlined,color: uuBlue,),label: 'UU222010074',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.email_outlined,color: uuBlue,),label: 'Zaidsayyed07869@gmail.com',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.phone_outlined,color: uuBlue,),label: '+91 9773817540',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.business_outlined,color: uuBlue,),label: 'Alaknanda',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.bed_outlined,color: uuBlue,),label: 'B-107',enabled: isedit,),
              MyInputField(prefix:Icon(Icons.person_outline,color: uuBlue,) ,suffix: Icon(Icons.home_work_outlined,color: uuBlue,),label: 'Guardian Name',enabled: isedit,),
              MyInputField(prefix:Icon(Icons.phone_outlined,color: uuBlue,) ,suffix: Icon(Icons.home_work_outlined,color: uuBlue,),label: '+91 xxxxxxxxxx',enabled: isedit,),
              MyInputField(prefix:Icon(Icons.email_outlined,color: uuBlue,) ,suffix: Icon(Icons.home_work_outlined,color: uuBlue,),label: '',enabled: isedit,),
              MyInputField(prefix: Icon(Icons.home_work_outlined,color: uuBlue,),label: 'Room no : 503 , 5th floor Shifa Palace B wing Amrut Nagar Mumbra (E) Thane 400612 Maharashtra India',enabled: isedit,maxline: 2,),
              SizedBox(height: 20,),
              Roundbutton(name: 'Log Out', onTap: (){
              }),
              SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    );
  }
}


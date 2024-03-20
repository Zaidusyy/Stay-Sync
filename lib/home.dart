import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/Drawer_Screens/Aboutus.dart';
import 'package:uu_hostel_management/Notice.dart';
import 'package:uu_hostel_management/Slider/SliderScreen.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Stay Sync',
          style: TextStyle(color: uuBlue),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: MyDrawer(contxt: context,),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SliderScreen(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:  EdgeInsets.all(10),
              child: Text('FEATURES',style: TextStyle(color: uuBlue,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Row(children: [
              Roundmenu(name: 'NOTICE', icon: Icons.note_alt_outlined, navigate:Notice()),
              SizedBox(width: 10,),
              Roundmenu(name: 'WALLET', icon: Icons.account_balance_wallet_outlined, navigate: null),

            ],),
            Row(children: [
              Roundmenu(name: 'LAUNDRY', icon: Icons.local_laundry_service_outlined, navigate: null),
              SizedBox(width: 10,),
              Roundmenu(name: 'MESS', icon: Icons.food_bank_outlined, navigate:null),
            ],),
            Row(children: [

              Roundmenu(name: 'PASS', icon: Icons.exit_to_app_outlined, navigate: null),
              SizedBox(width: 10,),
              Roundmenu(name: 'BUS', icon: Icons.directions_bus_outlined, navigate: null),
            ],),

            Row(children: [
              Roundmenu(name: 'SPORTS', icon: Icons.sports_cricket_outlined, navigate:null),
              SizedBox(width: 10,),
              Roundmenu(name: 'EVENTS', icon: Icons.event_note_outlined, navigate: null),
            ],), Row(children: [
              Roundmenu(name: '  HELP & COMPLAINT', icon: Icons.feedback_outlined, navigate: null,fontsize: 20,),

            ],),

          ],
        ),
      ),
    );
  }
}

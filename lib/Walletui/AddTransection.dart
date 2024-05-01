import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/Walletui//Wallet.dart';

class AddTransection extends StatelessWidget {
  AddTransection({super.key});

  final amountcontroller = TextEditingController();
  final notecontroller = TextEditingController();



  final _firebaseFirestore = FirebaseFirestore.instance.collection('Wallet');

  void addTransaction(String type) {
      FirebaseAuth auth = FirebaseAuth.instance;
      final uid = auth.currentUser!.uid.toString();
      final amount=amountcontroller.text.toString();
      print(amount.toString());
      if(amount.isNotEmpty && notecontroller.text.isNotEmpty) {
        _firebaseFirestore.add({
          'uid': uid,
          'type': type,
          'time': DateTime.now().toString(),
          'amount': amount,
          'note': notecontroller.text.toString()
        }).then((_) {
          print('Transaction added successfully!');
        }).catchError((error) {
          print('Failed to add transaction: $error');
        });
      }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Transection',
            style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: uuBlue),
        backgroundColor: uuWhite,
      ),
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
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: uuLightRed, width: 2)),
                child: Column(
                  children: [
                    MyInputField(
                        label: 'Note',
                        controller: notecontroller,
                        prefix: Icon(
                          Icons.note_alt_outlined,
                          color: uuBlue,
                        )),
                    MyInputField(
                      label: 'Amount',
                      prefix: Icon(
                        Icons.attach_money_outlined,
                        color: uuBlue,
                      ),
                      keyboardtype: TextInputType.number,
                      controller: amountcontroller,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Roundbutton(
                            name: 'Income',
                            onTap: () {
                              addTransaction('Income');
                              Navigator.pop(context);
                            }),
                        Roundbutton(
                            name: 'Expenses',
                            onTap: () {
                              addTransaction('Expenses');
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

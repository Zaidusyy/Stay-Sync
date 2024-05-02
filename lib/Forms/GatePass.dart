import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uu_hostel_management/Constants.dart';

class GatePass extends StatefulWidget {
  const GatePass({super.key});

  @override
  State<GatePass> createState() => _GatePassState();
}

class _GatePassState extends State<GatePass> {
  DateTime fromdate = DateTime(1111, 11, 11);
  DateTime todate = DateTime(1111, 11, 11);
  bool chkdate = true, Generate = false;
  final reason = TextEditingController();
  String documentid = "";

  void generategatepassreq() {
    final _firebaseFirestore =
        FirebaseFirestore.instance.collection('Gate Pass');
    final uid = FirebaseAuth.instance.currentUser!.uid.toString();

    _firebaseFirestore.add({
      'uid': uid,
      'req time': DateTime.now().toString(),
      'from': fromdate.toString().substring(0, 11),
      'to': todate.toString().substring(0, 11),
      'reason': reason.text.toString(),
      'status': false,
    }).then((DocumentReference document) {
      print('Success');
      _firebaseFirestore
          .doc(document.id)
          .update({'docid': document.id}).then((value) {
        documentid = document.id.toString();
        Generate = true;
        setState(() {});
      });
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) => setState(() {
          if (chkdate == true) {
            fromdate = value!;
          } else {
            todate = value!;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.library_books_outlined,
                color: uuBlue,
                size: 30,
              )),
          SizedBox(
            width: 5,
          )
        ],
        backgroundColor: uuWhite,
        title: Text(
          'Gate Pass',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
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
                padding: (Generate && documentid != "")
                    ? EdgeInsets.all(50)
                    : EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: uuLightRed, width: 2)),
                child: (Generate && documentid != "")
                    ? Column(
                        children: [
                          PrettyQrView.data(data: documentid),
                          // ' ${reason.text.toString()} | Approved |${fromdate.toString().substring(0, 11)}| ${todate.toString().substring(0, 11)}'),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            documentid.toString(),
                            // "Approved from ${fromdate.toString().substring(0, 11)} to ${todate.toString().substring(0, 11)}",
                            style: TextStyle(color: uuBlue, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          MyTextFieldContainer(
                              prefix: Icon(
                                Icons.calendar_month_outlined,
                                color: uuBlue,
                              ),
                              ontap: () {
                                chkdate = true;
                                _showDatePicker();
                              },
                              label: (fromdate != DateTime(1111, 11, 11))
                                  ? fromdate.toString().substring(0, 11)
                                  : 'From Date'),
                          MyTextFieldContainer(
                              prefix: Icon(
                                Icons.calendar_month_outlined,
                                color: uuBlue,
                              ),
                              ontap: () {
                                chkdate = false;
                                _showDatePicker();
                              },
                              label: (todate != DateTime(1111, 11, 11))
                                  ? todate.toString().substring(0, 11)
                                  : 'To Date'),
                          MyInputField(
                            label: 'Reason',
                            controller: reason,
                            prefix: Icon(
                              Icons.work_history_outlined,
                              color: uuBlue,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Roundbutton(
                              name: 'Generate',
                              onTap: () {
                                if (fromdate != DateTime(1111, 11, 11) &&
                                    todate != DateTime(1111, 11, 11) &&
                                    reason.text.isNotEmpty) {
                                  generategatepassreq();
                                }
                                // setState(() {});
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Pass Approval time is 6-PM to 8-PM',
                            style: TextStyle(color: uuBlue),
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

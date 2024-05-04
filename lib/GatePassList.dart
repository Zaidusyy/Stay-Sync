
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uu_hostel_management/GatePassQR.dart';

import 'Constants.dart';

class GatePassList extends StatelessWidget {
  GatePassList({super.key});

  final uid = FirebaseAuth.instance.currentUser?.uid.toString();
  final _firebasefirestore =
      FirebaseFirestore.instance.collection('GatePass').orderBy('req time',descending: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: uuLightBlue,
        title: Text(
          'All Passes',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: lightgradiant,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: StreamBuilder<QuerySnapshot>(
            stream: _firebasefirestore,
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: uuBlue,));
              }
              return ListView.builder(
                   itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                     if(snapshot.hasData &&
                         snapshot.data?.docs[index]['uid'] == uid) {
                       return Container(
                         margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                         padding: EdgeInsets.all(8),
                         decoration: BoxDecoration(
                             color: uuWhite.withOpacity(0.2),
                             borderRadius: BorderRadius.circular(5)),
                         child: ListTile(
                           onTap: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) =>
                                         GatePassQR(
                                           tag:snapshot.data?.docs[index]['docid'].toString()
                                         )));
                           },
                           leading: Hero(
                               tag: snapshot.data?.docs[index]['docid'],
                               child: PrettyQrView.data(
                                 data: '${snapshot.data?.docs[index]['docid']}',
                               )),
                           contentPadding: EdgeInsets.all(10),
                           title: Text(
                             (snapshot.data?.docs[index]['status'])
                                 ? 'Approved'
                                 : 'Not Approved',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold, color: uuRed),
                           ),
                           subtitle: Text(
                             '${snapshot.data
                                 ?.docs[index]['from']} to ${snapshot.data
                                 ?.docs[index]['to']}',
                             style: TextStyle(
                                 color: uuBlue, fontWeight: FontWeight.w600),
                           ),
                           trailing: Text(
                             '${snapshot.data?.docs[index]['req time']
                                 .toString()
                                 .substring(0, 11)}',
                             style: TextStyle(color: uuBlue),
                           ),
                         ),
                       );
                     }
                  });
            }),
      ),
    );
  }
}

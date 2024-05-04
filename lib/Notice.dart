import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {

    final _firebaseFirestore =
    FirebaseFirestore.instance.collection('Notice').orderBy('time',descending: true).snapshots();


    return Scaffold(
      backgroundColor: uuWhite,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: uuLightBlue,
        title: Text(
          'Notice',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: double.infinity,width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(gradient: LinearGradient(colors: lightgradiant,begin: Alignment.topLeft,end: Alignment.bottomRight)),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore,
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(color: uuBlue,),);
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(color:uuWhite.withOpacity(0.4),borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),
        
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${snapshot.data?.docs[index]['user'].toString().toUpperCase()}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: uuRed),),
        
                        Text('${snapshot.data?.docs[index]['topic']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: uuBlue),textAlign: TextAlign.center,),
                        Text('${snapshot.data?.docs[index]['time']}'),
                        SizedBox(height: 10,),
                        Image(
                          image: NetworkImage(
                            '${snapshot.data?.docs[index]['image']}',
                          ),
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${snapshot.data?.docs[index]['text']}",
                          style: TextStyle(
                            color: uuBlue,fontSize: 15,fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
        ),
      ),
    );
  }
}

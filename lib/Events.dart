import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/EvnetBlog.dart';
import 'Constants.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final _firebasefirsotore = FirebaseFirestore.instance
        .collection('Events')
        .orderBy('time', descending: true)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: uuLightBlue,
        title: Text(
          'Evnets',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: uuWhite,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: lightgradiant,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: StreamBuilder<QuerySnapshot>(
            stream: _firebasefirsotore,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: uuBlue,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final temp = snapshot.data;
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      color: uuWhite.withOpacity(0.2),
                      // decoration: BoxDecoration(
                      //  borderRadius: BorderRadius.circular(10),
                      //
                      //   border: Border.all(
                      //       color: uuWhite.withOpacity(0.4), width: 2),
                      // ),
                      child: ListTile(
                        onTap: () {
                          //   print(temp?.docs[index].id);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EventBlog(
                                    tag: temp?.docs[index].id,
                                    image: temp?.docs[index]['image'],
                                    title: temp?.docs[index]['title'],
                                    text: temp?.docs[index]['text'],
                                  )));
                        },
                        contentPadding: EdgeInsets.all(10),
                        leading: Hero(
                          tag: temp!.docs[index].id,
                          //transitionOnUserGestures: true,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: uuBlue.withOpacity(0.6), width: 2),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        temp?.docs[index]['image']),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        title: Text(temp?.docs[index]['title']),
                        trailing: Text(temp?.docs[index]['time']),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}

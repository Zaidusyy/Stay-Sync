import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/GatePassQR.dart';

class Laundry extends StatelessWidget {
  Laundry({Key? key}) : super(key: key);

  final _firestore = FirebaseFirestore.instance.collection('Laundry').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: uuLightBlue,
        title: Text(
          'Laundry',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.qr_code,
              color: uuBlue,
              size: 30,
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: lightgradiant,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => GatePassQR(
                          tag: snapshot.data?.docs[index]['docid'],
                          laundrydata: {
                            'bedsheet': snapshot.data?.docs[index]['bedsheet'],
                            'half pant': snapshot.data?.docs[index]['half pant'],
                            'kurta': snapshot.data?.docs[index]['kurta'],
                            'lower': snapshot.data?.docs[index]['lower'],
                            'pant': snapshot.data?.docs[index]['pant'],
                            'pillow cover': snapshot.data?.docs[index]['pillow cover'],
                            'shirt': snapshot.data?.docs[index]['shirt'],
                            'total': snapshot.data?.docs[index]['total'],
                            'towel': snapshot.data?.docs[index]['towel'],
                            'tshirt': snapshot.data?.docs[index]['tshirt'],
                            'washed': snapshot.data?.docs[index]['washed'],
                          },
                        ),
                      ),
                    );
                  },
                  leading: Hero(
                    tag: snapshot.data?.docs[index]['docid'] ?? '',
                    child: PrettyQrView.data(
                      data: '${snapshot.data?.docs[index]['docid'] ?? ''}',
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  title: Text(
                    (snapshot.data?.docs[index]['delivery_date'] != "")
                        ? 'Delivered on ${snapshot.data!.docs[index]['delivery_date']}'
                        : 'Estimated Delivery ${DateTime.now().toString().substring(0, 11)}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  subtitle: Text('${snapshot.data!.docs[index]['total'].toString()} Cloths'),
                  trailing: Icon(Icons.done_all, color: uuBlue),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

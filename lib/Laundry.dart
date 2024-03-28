import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Laundry extends StatelessWidget {
  const Laundry({super.key});

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
              )),
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
                end: Alignment.bottomRight)),
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.qr_code_2_outlined,
                  size: 80,
                  color: uuBlue,
                ),
                contentPadding: EdgeInsets.all(10),
                title:Text(((index%2!=0) )?'Delivered on 12 March':
                  'Estimated Delivery 22 March 2024',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                subtitle: Text('5 clothes'),
                trailing: Icon(Icons.done_all,color: uuBlue,),
              );
            }),
      ),
    );
  }
}

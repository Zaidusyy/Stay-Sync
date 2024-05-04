import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'Constants.dart';

class GatePassQR extends StatelessWidget {
  final tag;
  final Map<String, dynamic>? laundrydata;
   GatePassQR({super.key,this.tag,this.laundrydata});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: uuLightBlue,
        title: Text(
          'Scan Now',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,width: double.infinity,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(gradient: LinearGradient(colors: lightgradiant,begin: Alignment.topLeft,end: Alignment.bottomRight)),
          child:SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Hero(tag:tag,child: PrettyQrView.data(data: tag)),
                    SizedBox(height: 50,),
                    Text(tag,style: TextStyle(fontSize: 25,color: uuBlue,fontWeight: FontWeight.bold),),
                    Container(width: double.infinity,padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: uuLightBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: (laundrydata!=null)?Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Text(
                          'Bedsheet: ${laundrydata?['bedsheet']}\n' +
                              'Half Pant: ${laundrydata?['half pant']}\n' +
                              'Kurta: ${laundrydata?['kurta']}\n' +
                              'Lower: ${laundrydata?['lower']}\n' +
                              'Pant: ${laundrydata?['pant']}\n' +
                              'Pillow Cover: ${laundrydata?['pillow cover']}\n' +
                              'Shirt: ${laundrydata?['shirt']}\n' +
                              'Towel: ${laundrydata?['towel']}\n' +
                              'T-shirt: ${laundrydata?['tshirt']}\n' +
                              'Washed: ${laundrydata?['washed']?'Yes':'No'}\n' + 'Total: ${laundrydata?['total']}\n',
                          style: TextStyle(fontSize: 22, color: uuBlue, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                        )
                      ],):SizedBox(),
                    )
                  ],
                )),
          )),
    );
  }
}

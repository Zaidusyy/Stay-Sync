import 'package:flutter/material.dart';

import 'Constants.dart';

class EventBlog extends StatelessWidget {
  final tag;
  const EventBlog({super.key,this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: uuLightBlue,
        title: Text(
          'Evnet Blog',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: tag,
              child: Container(
                height: 250, // Adjust height for destination widget
                width:double.infinity, // Adjust width for destination widget
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                  border: Border.all(color: uuBlue.withOpacity(0.6), width: 5),
                  image: DecorationImage(
                    image: NetworkImage('https://uniteduniversity.edu.in/images/Menu_Img/Placement.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'We are open and Welcoming Patients',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: uuBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "\nUnited Group established in the year 1998 with its glorious journey of 32 years in the field of education; highly qualified and competent team of faculty; enormous world-class infrastructure & facilities most conducive to academic pursuit along with its remarkably successful campus placements, proudly shares the launch of its revolutionizing dream venture - United University, approved by the State Government under the Private University Act!",
              style: TextStyle(fontSize: 22, color: uuBlue,fontWeight: FontWeight.w400),textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

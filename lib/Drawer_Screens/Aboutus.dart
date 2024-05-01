import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold, color: uuBlue),
        ),
        backgroundColor: uuWhite,
        centerTitle: true,
      ),
      drawer: MyDrawer(contxt: context,),
      body: Container(
        padding: EdgeInsets.only(left: 15,right: 15,top: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(uuLightBlue.withOpacity(0.5), BlendMode.screen),
            image: NetworkImage(
              'https://uniteduniversity.edu.in/images/Content_Img/About_1.JPG',
            ),
          ),
          backgroundBlendMode: BlendMode.softLight,
          gradient: LinearGradient(
              colors: logingradiant,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: NetworkImage('https://www.hindustantimes.com/ht-img/img/2023/04/27/1600x900/Screenshot_2023-04-27_141337_1682585196083_1682585208040.png'),width: double.infinity,),
              Text(
                "\nUnited Group established in the year 1998 with its glorious journey of 32 years in the field of education; highly qualified and competent team of faculty; enormous world-class infrastructure & facilities most conducive to academic pursuit along with its remarkably successful campus placements, proudly shares the launch of its revolutionizing dream venture - United University, approved by the State Government under the Private University Act!",
                style: TextStyle(fontSize: 22, color: uuBlue,),
              ),
              Text(
                "\nUNITED UNIVERSITY is a newly emerging, multidisciplinary and one of the most promising Universities set up to facilitate quality research and training with the launch of its courses across the academic spectrum spanning Arts, Sciences, Commerce, Engineering, Management, Agriculture, Mass Communication etc.",
                style: TextStyle(color: uuBlue,fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "\nUU is at the forefront of learning, teaching and research in various fields and envisages providing education par excellence and contributing towards empowering the nation by producing skilled professionals!",
                style: TextStyle(fontSize: 22, color: uuBlue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

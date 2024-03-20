import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Notice extends StatelessWidget {
  const Notice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        backgroundColor: uuWhite,
        title: Text(
          'Notice',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 5),
              width: double.infinity,
              decoration: BoxDecoration(color:uuLightBlue.withOpacity(0.5),borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(top: 15,left: 10,right: 10,bottom: 15),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Holiday Office Closure Notice',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: uuBlue),),
                  Text('12 January 2024'),
                  SizedBox(height: 10,),
                  Image(
                    image: NetworkImage(
                      'https://images.template.net/313265/Holiday-Office-Closure-Notice-Template-edit-online.jpg',
                    ),
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "A Temporary Event Notice is a time-limited licence, which authorises specified 'licensable activities' at a defined location or 'premises'. A premise may be one room, a series of rooms, a whole building, a field or other open space.",
                    style: TextStyle(
                      color: uuBlue,fontSize: 15,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

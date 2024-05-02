import 'package:flutter/material.dart';
import 'package:uu_hostel_management/EvnetBlog.dart';
import 'Constants.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EventBlog(tag: 'event-$index',)));
              },
              contentPadding: EdgeInsets.all(10),
              leading: Hero(
                tag: 'event-$index',
                //transitionOnUserGestures: true,
                child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: uuBlue.withOpacity(0.6), width: 2),
                      image: DecorationImage(image: NetworkImage('https://uniteduniversity.edu.in/images/Menu_Img/Placement.jpg'),fit: BoxFit.cover)
                    ),
                  ),
              ),

              title: Text('title title title titletitle titletitle title'),
              trailing: Text(DateTime.now().toString().substring(0, 11)),
            );
          }),
    );
  }
}




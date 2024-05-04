import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class EventBlog extends StatelessWidget {
  final tag,text,image,title;
   EventBlog({super.key,this.tag,this.title,this.text,this.image});

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
      body: Container(
        height: double.infinity,width: double.infinity,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(gradient: LinearGradient(colors: lightgradiant,begin: Alignment.topLeft,end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: tag,
                child: Container(
                  height: 250, // Adjust height for destination widget
                  width:double.infinity, // Adjust width for destination widget
               //   margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                    border: Border.all(color: uuBlue.withOpacity(0.5), width: 3),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: uuBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(

                margin: EdgeInsets.only(left: 5,right: 5,bottom: 50),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: uuWhite.withOpacity(0.3),borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "$text",
                  style: TextStyle(fontSize: 22, color: uuBlue,fontWeight: FontWeight.w500),textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

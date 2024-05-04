import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HelpAndComplaint extends StatefulWidget {
  const HelpAndComplaint({super.key});

  @override
  State<HelpAndComplaint> createState() => _HelpAndComplaintState();
}

class _HelpAndComplaintState extends State<HelpAndComplaint> {

  String selectedtype='Select Type';
  final Ctext=TextEditingController();


  final _firebaseFirestore=FirebaseFirestore.instance.collection('Complaint');
  sendcomplaint(){
    print('step 1');
    FirebaseAuth auth=FirebaseAuth.instance;
    final uid=auth.currentUser!.uid.toString();
    if(selectedtype!='Select Type'&& Ctext.text.toString().length>15) {
      print('step2');
      _firebaseFirestore.doc(uid).collection(selectedtype).add({
        'uid': uid,
        'Text': Ctext.text.toString(),
        'time':DateTime.now()
      }).then((value) {
        Ctext.text='';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('We\'ll respond soon'),backgroundColor: uuBlue,));
      }).onError((error, stackTrace) {
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Problem connecting to server'),backgroundColor: uuRed,));
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in the reason or select the type properly',),backgroundColor: uuRed,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.library_books_outlined,color: uuBlue,size: 30,)),SizedBox(width: 5,)],
        backgroundColor: uuLightBlue,
        centerTitle: true,
        title: Text(
          'Help & Cpmplaint',
          style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: logingradiant,
              end: Alignment.topCenter,
              begin: Alignment.bottomRight,
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  'assets/uubannerpng.png',
                ),
                height: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                EdgeInsets.only(top: 30, bottom: 30, left: 5, right: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: uuLightRed, width: 2)),
                child:Column(
                  children: [

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                        top: 20, right: 10, left: 10,),
                      padding: EdgeInsets.only(
                          top: 6, bottom: 6, left: 10, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: uuBlue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: uuWhite),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(),
                        value: selectedtype,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedtype = newValue!;
                          });
                        },
                        icon: Icon(
                          Icons.contact_support_outlined,
                          color: uuBlue,
                        ),
                        items: <String>['Select Type',
                          'Roommate',
                          'Mess',
                          'Laundry',
                          'Internet',
                          'Cleaning',
                          'Electrical'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: uuBlue),
                            ),
                          );
                        }).toList(),
                      ),
                    ),


                    MyInputField(
                      label: 'Write Full Complaint',
                      maxlength: 200,
                      maxline: 5,
                      prefix: Icon(
                        Icons.work_history_outlined,
                        color: uuBlue,
                      ),
                      controller: Ctext,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Roundbutton(name: 'Register', onTap: () {
                      print('hello');
                      sendcomplaint();
                    }),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'Complaint will be Considered within 2 working days',
                      style: TextStyle(color: uuRed),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}



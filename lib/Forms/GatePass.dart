import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class GatePass extends StatefulWidget {
  const GatePass({super.key});

  @override
  State<GatePass> createState() => _GatePassState();
}

class _GatePassState extends State<GatePass> {
  DateTime fromdate = DateTime(1111,11,11);
  DateTime todate=DateTime(1111,11,11);
  bool chkdate=true;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) => setState(() {
        if(chkdate==true){
          fromdate = value!;
        }
        else{
          todate=value!;
        }

        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.library_books_outlined,color: uuBlue,size: 30,)),SizedBox(width: 5,)],
        backgroundColor: uuWhite,
        title: Text(
          'Gate Pass',
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
                child: Column(
                  children: [

                    MyTextFieldContainer(
                        prefix: Icon(
                          Icons.calendar_month_outlined,
                          color: uuBlue,
                        ),
                        ontap: () {
                          chkdate=true;
                          _showDatePicker();
                        },
                        label: (fromdate != DateTime(1111,11,11))
                            ? fromdate.toString().substring(0, 11)
                            : 'From Date'),
                    MyTextFieldContainer(
                        prefix: Icon(
                          Icons.calendar_month_outlined,
                          color: uuBlue,
                        ),
                        ontap: () {
                          chkdate=false;
                          _showDatePicker();
                        },
                        label: (todate != DateTime(1111,11,11))
                            ? todate.toString().substring(0, 11)
                            : 'To Date'),
                    MyInputField(
                      label: 'Reason',
                      prefix: Icon(
                        Icons.work_history_outlined,
                        color: uuBlue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Roundbutton(name: 'Generate', onTap: () {}),
                    SizedBox(
                      height: 10,
                    ),

                        Text(
                          'Pass Approval time is 6-PM to 8-PM',
                          style: TextStyle(color: uuBlue),
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

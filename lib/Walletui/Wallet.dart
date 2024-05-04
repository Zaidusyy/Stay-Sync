import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/Walletui//AddTransection.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
   double income = 500,expenses = 900,balance = 300;

  late Map<String, double> datamap;

  @override
  void initState() {
    super.initState();
    datamap = {
      "Income": income,
      "Expenses": expenses,
      "Balance": balance,
    };
    fetchFirestoreData();
  }

  final uid = FirebaseAuth.instance.currentUser!.uid.toString();
  final _firebaseFirestore =
      FirebaseFirestore.instance.collection('Wallet').orderBy('time',descending: true).snapshots();

   void fetchFirestoreData() {
     _firebaseFirestore.listen((snapshot) {
       if (snapshot.docs.isNotEmpty) {

         double totalIncome = 0;
         double totalExpenses = 0;
         for (var doc in snapshot.docs) {
           if (doc['uid'] == uid) {
             String type = doc['type'];
             double amount = double.tryParse(doc['amount'] ?? '0') ?? 0;
             if (type == 'Income') {
               totalIncome += amount;
             } else if (type == 'Expenses') {
               totalExpenses += amount;
             }
           }
         }

         setState(() {
           datamap['Income'] = totalIncome;
           datamap['Expenses'] = totalExpenses;
           datamap['Balance']=totalIncome-totalExpenses;
         });
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wallet',
            style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: uuBlue),
        backgroundColor: uuLightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTransection()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: uuBlue,
        ),
        backgroundColor: uuLightBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomRight,
            colors: logingradiant,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'zaid',
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: uuWhite.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: PieChart(
                        dataMap: datamap,
                        animationDuration: Duration(milliseconds: 3000),
                        chartLegendSpacing: 40,
                        chartRadius: 150,
                        colorList: [uuBlue, uuRed, uuLightBlue],
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 25,
                        centerText: "Wallet",
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.rectangle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesOutside: true,
                          decimalPlaces: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: uuWhite.withOpacity(0.2),
                    ),
                    padding: EdgeInsets.all(10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: _firebaseFirestore,
                        builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true, // Add this line
                            physics:
                                NeverScrollableScrollPhysics(), // Add this line
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              if (snapshot.hasData &&
                                  snapshot.data?.docs[index]['uid'] == uid) {
                                final type=snapshot.data?.docs[index]['type'];
                                income+=(type=='Income')?double.parse(snapshot.data?.docs[index]['amount']):0;
                                expenses+=(type=='Expenses')?double.parse(snapshot.data?.docs[index]['amount']):0;
                                return ListTile(
                                  title: Text(type.toString()),
                                  subtitle: Text(
                                    snapshot.data?.docs[index]['amount'],
                                    style: TextStyle(color: uuRed),
                                  ),
                                  trailing: (type=='Income')?Icon(Icons.call_received_outlined,color: uuBlue,): Icon(
                                    Icons.call_made_outlined,
                                    color: uuRed,
                                  ),
                                );
                              }
                            },
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// ListTile(
// title: Text('Expences'),
// subtitle: Text(
// '200',
// style: TextStyle(color: uuRed),
// ),
// trailing: Icon(
// Icons.call_made_outlined,
// color: uuRed,
// ),
// );

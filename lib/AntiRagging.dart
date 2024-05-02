import 'package:flutter/material.dart';

import 'Constants.dart';

class AntiRagging extends StatelessWidget {
  const AntiRagging({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uuWhite,
      appBar: AppBar(
        title: Text(
          'Anti Ragging',
          style: TextStyle(fontWeight: FontWeight.bold, color: uuBlue),
        ),
        backgroundColor: uuWhite,
        centerTitle: true,
      ),
      drawer: MyDrawer(contxt: context,),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
          SizedBox(height: 10,),
           Center(
              child: Text(
                'Anti Ragging Committee',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30, color: uuBlue),
              )),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                AboutDoctor(image: 'https://scontent.fdel27-3.fna.fbcdn.net/v/t39.30808-6/296238354_5374392665982790_8893520598675722779_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=r1HmdpBkbJEQ7kNvgEE8bNR&_nc_ht=scontent.fdel27-3.fna&oh=00_AfAvxIX6cBbW9Hpul5jlwDXUha04fXrf8bUBaqrWGHXpDw&oe=6637BBF2', name: 'Dr. Santosh Kumar Sharma', profile: 'Chairman/Nodal Officer'),
                AboutDoctor(image: 'https://www.pngkey.com/png/detail/119-1195779_steve-thompson-man-icon-png-png.png', name: 'Dr. Shashikant Upadhyay', profile: 'Secretary'),
                AboutDoctor(image: 'https://media.licdn.com/dms/image/D4D03AQEVX-5Y59IOpQ/profile-displayphoto-shrink_800_800/0/1663945966273?e=1720051200&v=beta&t=8kClDQ4frlPCZwuLjPc-bNxLJ8VQ22kpPrqtI4b6RRU', name: 'Dr. Nishant Dabade', profile: 'Member'),
                AboutDoctor(image: 'https://cdn-icons-png.flaticon.com/512/1271/1271389.png', name: 'Mrs. Roopa Das', profile: 'Member'),
              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "\nWe take pride for achieving 100% ragging free sessions year after year including our recent session of 2017 - 2018. Ragging is a punishable offense. Indulging in any form of ragging may lead to imprisonment of rustication. Ragging is prohibited as per the decision of the supreme court of Indian writ petition no. (c) 656/1998. We have maintained strong administration across our campuses including hostels to refrain any student being a victim of ragging. Our anti - disciplinary team is hyper active and makes sure that law and order is maintained without fail when it comes to ragging incidents.",
              style: TextStyle(fontSize: 22, color: uuBlue,fontWeight: FontWeight.w500),textAlign: TextAlign.center,
            ),
          ),
        ],),
      ),
    );
  }
}

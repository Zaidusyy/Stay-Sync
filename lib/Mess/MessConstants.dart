import 'package:flutter/material.dart';

import '../Constants.dart';


strconvert(String str){

  return str.replaceAll(',', ' \n ');
}


class Messmenucard extends StatelessWidget {
  String title, items;
  String backgroundimage;
  Messmenucard(
      {super.key,
      required this.title,
      required this.items,
      this.backgroundimage = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: uuLightRed,
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: uuRed, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            width: double.infinity,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: uuLightRed,
                // backgroundBlendMode: BlendMode.softLight,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        uuLightRed.withOpacity(0.4), BlendMode.screen),
                    image: NetworkImage(backgroundimage),
                    fit: BoxFit.cover),
                //color: uuWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: uuLightRed, width: 2)),
            child: Text(
              items,
              style: TextStyle(
                  color: uuBlue, fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class MessDayMenu extends StatelessWidget {
  String breakfast, lunch, sncaks, dinner;
  String breakfastimage, lunchimage, sncaksimage, dinnerimage;
  MessDayMenu(
      {super.key,
      required this.breakfast,
      required this.lunch,
      required this.sncaks,
      required this.dinner,
      this.breakfastimage =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIAO-KlbUaorOuza5VTA0lp7dqUoN2IwhTy6xubVbC2g&s',
      this.lunchimage =
          'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG',
      this.sncaksimage =
          'https://lh5.googleusercontent.com/proxy/iUoqX_HgVzOpEROJU86MnW80hb9FupltG__ofpvVZ-hwbgIlfK6Adq_lrqGKwIF00yXs9HoQWbOG1_z4fcF_1MavlnIY6an_snh52f-AvKRcOi7nK97Y2D1CqXjnhA',
      this.dinnerimage =
          'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG'});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Messmenucard(
            title: 'Breakfast',
            items: breakfast.replaceAll(',', '\n'),
            backgroundimage: breakfastimage,
          ),
          Messmenucard(
            title: 'Lunch',
            items:
                lunch.replaceAll(',', '\n'),
            backgroundimage:
                lunchimage,
          ),
          Messmenucard(
            title: 'Snacks',
            items: sncaks.replaceAll(',', '\n'),
            backgroundimage:
                sncaksimage ),
          Messmenucard(
            title: 'Dinner',
            items:
                dinner.replaceAll(',', '\n'),
            backgroundimage:
                dinnerimage,
          ),
        ],
      ),
    );
  }
}

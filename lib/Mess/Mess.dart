import 'package:flutter/cupertino.dart';
import 'package:uu_hostel_management/Mess/MessConstants.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';

class Mess extends StatelessWidget {
  const Mess({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: uuWhite,
        appBar: AppBar(
          title: Text(
            'Mess',
            style: TextStyle(color: uuBlue, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: uuLightBlue,
          bottom: TabBar(
            labelPadding: EdgeInsets.only(left: 20, right: 20),
            indicatorPadding: EdgeInsets.only(left: 5, right: 5),
            indicatorWeight: 3.0,
            isScrollable: true,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: uuBlue,
            tabs: [
              Tab(
                  child: Text(
                'Monday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Tuesday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Wednesday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Thursday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Friday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Saturday',
                style: tabbartextstyle,
              )),
              Tab(
                  child: Text(
                'Sunday',
                style: tabbartextstyle,
              )),
            ],
          ),
        ),
        body: TabBarView(children: [
          MessDayMenu(
              breakfast: 'Puri,Sabji,Jalebi,Chai',
              lunch: 'Daal tadka,Seasonal Sabji,Roti,Rice,Salad,Achar',
              sncaks: 'Pasta,Chai',
              dinner: 'Daal tadka,Seasonal sabji,Roti,Risce,Sala,Achar'),
          MessDayMenu(
              breakfast: 'Poha,Bread,Butter,Jam,Chai',
              breakfastimage:
                  'https://i.ytimg.com/vi/3eUE5J7Y5PU/maxresdefault.jpg',
              lunch: 'Kali Masoor Daal,Mix Veg,Roti,Rice,Achar,Salad',
              lunchimage: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/6f/f0/d2/mix-vegetable-with-roti.jpg',
              sncaks: 'Bread-Aloo Sandwich,Chai',
              sncaksimage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7ujfekeIH3ZHd1zodhpGMfVboLPOMXkbtT7Z1mH2NQ&s' ,
              dinner: 'Aloo-Soyabeen Sabji,Chana Dall,Roti,Rice,Salad,Achar',
          dinnerimage: 'https://img-global.cpcdn.com/recipes/171c82a897a32b34/680x482cq70/%E0%A4%B8%E0%A4%AF%E0%A4%AC%E0%A4%A8-%E0%A4%95-%E0%A4%B8%E0%A4%AC%E0%A4%9C-%E0%A4%9A%E0%A4%B5%E0%A4%B2-soyabean-ki-sabzi-chawal-recipe-in-hindi-%E0%A4%B0%E0%A4%B8%E0%A4%AA-%E0%A4%AE%E0%A4%96%E0%A4%AF-%E0%A4%A4%E0%A4%B8%E0%A4%B5%E0%A4%B0.jpg',),
          MessDayMenu(
            breakfast: 'Besan chilla,Green chatni,chai',
            breakfastimage:
                'https://www.spiceupthecurry.com/wp-content/uploads/2014/11/besan-chilla-1.jpg',
            lunch: 'Arhar daal tadka,Seasonal Sabji,Rice ,Roti,Salad,Achar',
            sncaks: 'Pasta, Chai',
            sncaksimage:
                'https://i.pinimg.com/originals/f1/f6/31/f1f631eded29181b045b9fe7c5a47b0f.jpg',
            dinner: 'Lal Masoor Dall,Veg Kofta,Rice,Roti,Salad,Milk/Kheer',
            dinnerimage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaCrteEgwNkBb37GJLiX1e4-8D-1sZp9x2JMIpprMixA&s',
          ),
          MessDayMenu(
            breakfast: 'Puri,Sabji,Jalebi,Chai',
            breakfastimage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIAO-KlbUaorOuza5VTA0lp7dqUoN2IwhTy6xubVbC2g&s',
            lunch: 'Daal tadka,Seasonal Sabji,Roti,rice,Salad,Achar',
            lunchimage: 'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG',
            sncaks: 'Pasta,Chai',
            sncaksimage:
            'https://lh5.googleusercontent.com/proxy/iUoqX_HgVzOpEROJU86MnW80hb9FupltG__ofpvVZ-hwbgIlfK6Adq_lrqGKwIF00yXs9HoQWbOG1_z4fcF_1MavlnIY6an_snh52f-AvKRcOi7nK97Y2D1CqXjnhA',
            dinner: 'Daal tadka,Seasonal Sabji,Roti,rice,Salad,Achar',
            dinnerimage:
            'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG',
          ),
          MessDayMenu(
              breakfast: 'Poha,Bread,Butter,Jam,Chai',
              breakfastimage:
                  'https://i.ytimg.com/vi/3eUE5J7Y5PU/maxresdefault.jpg',
              lunch: 'Kali Masoor Daal,Mix Veg,Roti,Rice,Achar,Salad',
              lunchimage: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/6f/f0/d2/mix-vegetable-with-roti.jpg',
              sncaks: 'Bread-Aloo Sandwich,Chai',
              sncaksimage:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7ujfekeIH3ZHd1zodhpGMfVboLPOMXkbtT7Z1mH2NQ&s' ,
              dinner: 'Aloo-Soyabeen Sabji,Chana Dall,Roti,Rice,Salad,Achar',
          dinnerimage: 'https://img-global.cpcdn.com/recipes/171c82a897a32b34/680x482cq70/%E0%A4%B8%E0%A4%AF%E0%A4%AC%E0%A4%A8-%E0%A4%95-%E0%A4%B8%E0%A4%AC%E0%A4%9C-%E0%A4%9A%E0%A4%B5%E0%A4%B2-soyabean-ki-sabzi-chawal-recipe-in-hindi-%E0%A4%B0%E0%A4%B8%E0%A4%AA-%E0%A4%AE%E0%A4%96%E0%A4%AF-%E0%A4%A4%E0%A4%B8%E0%A4%B5%E0%A4%B0.jpg',),
          MessDayMenu(
            breakfast: 'Besan chilla,Green chatni,chai',
            breakfastimage:
                'https://www.spiceupthecurry.com/wp-content/uploads/2014/11/besan-chilla-1.jpg',
            lunch: 'Arhar daal tadka,Seasonal Sabji,Rice ,Roti,Salad,Achar',
            sncaks: 'Pasta, Chai',
            sncaksimage:
                'https://i.pinimg.com/originals/f1/f6/31/f1f631eded29181b045b9fe7c5a47b0f.jpg',
            dinner: 'Lal Masoor Dall,Veg Kofta,Rice,Roti,Salad,Milk/Kheer',
            dinnerimage:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaCrteEgwNkBb37GJLiX1e4-8D-1sZp9x2JMIpprMixA&s',
          ),
          MessDayMenu(
            breakfast: 'Puri,Sabji,Jalebi,Chai',
            breakfastimage:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIAO-KlbUaorOuza5VTA0lp7dqUoN2IwhTy6xubVbC2g&s',
            lunch: 'Daal tadka,Seasonal Sabji,Roti,rice,Salad,Achar',
            lunchimage: 'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG',
            sncaks: 'Pasta,Chai',
            sncaksimage:
            'https://lh5.googleusercontent.com/proxy/iUoqX_HgVzOpEROJU86MnW80hb9FupltG__ofpvVZ-hwbgIlfK6Adq_lrqGKwIF00yXs9HoQWbOG1_z4fcF_1MavlnIY6an_snh52f-AvKRcOi7nK97Y2D1CqXjnhA',
            dinner: 'Daal tadka,Seasonal Sabji,Roti,rice,Salad,Achar',
            dinnerimage:
            'https://www.chezshuchi.com/images/dal-chawal-sabji-roti-platter.JPG',
          ),

        ]),
      ),
    );
  }
}

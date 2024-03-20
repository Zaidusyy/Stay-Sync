
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Constants.dart';
import 'package:uu_hostel_management/Forms/Login.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List imageList = [
    {
      "id": 1,
      "navigate": Login(),
      "image_path":
          'https://www.hindustantimes.com/ht-img/img/2023/04/27/1600x900/Screenshot_2023-04-27_141337_1682585196083_1682585208040.png'
    },
    {
      "id": 2,
      "navigate": Login(),
      "image_path": 'https://uniteduniversity.edu.in/images/Menu_Img/About.JPG'
    },
    {
      "id": 3,
      "navigate": Login(),
      "image_path": 'https://i.ytimg.com/vi/tibOZdfR_fI/maxresdefault.jpg'
    },
    {
      "id": 4,
      "navigate": Login(),
      "image_path":
          'https://www.collegebatch.com/static/clg-gallery/united-university-allahabad-188775.jpg'
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          InkWell(
            onTap: () {
              // print(currentIndex);
            },
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => InkWell(
                      onTap: (){
                        Navigator.push(context, (MaterialPageRoute(builder: (context)=>item['navigate'])));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(item['image_path']),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 1.8,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 7,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            currentIndex == entry.key ? uuBlue : uuRed),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ]);
  }
}

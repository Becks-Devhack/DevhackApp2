import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'CarouselSlider2.dart';
import 'Recommendation.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'RecommendationCell.dart';

class HomeScreen extends StatelessWidget {
  List<Patient> patientList = [
    new Patient("Divertiland", 20, "https://static.iabilet.ro/img/db/site/00/01/a9/00000099345-e71a.png?ts=1585564947"),
    new Patient("Teatrul National", 15, "https://www.ziarulmetropolis.ro/wp-content/uploads/2013/03/Sigla-TNB-alb3.jpg"),
    new Patient("Marcel Marcel3", 52, "Are afectiuni la cap"),
    new Patient("Marcel Marcel4", 53, "Are afectiuni la cap"),
    new Patient("Marcel Marcel5", 54, "Are afectiuni la cap"),
  ];

  List<PatientCell> patientCellsList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    for (Patient patient in patientList) {
      patientCellsList
          .add(new PatientCell(width: width, height: height, patient: patient));
    }

    return Scaffold(
      body: Container(
        //child: CarouselSlider2(listItems: patientCellsList),
          child: Column(
            children: [
              Container(
                height: 0.45 * height,
                width: width,
                alignment: Alignment.topRight,
                child: Stack(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Image.asset('assets/elipse.png'),
                    ]),
                    Container(
                      alignment: Alignment.topRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/om.png",
                                height: 80,
                                width: 80,
                              ),
                              SizedBox(width: 20)
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Positioned(
                                  top: 30,
                                  right: 10,
                                  child: Text(
                                    "Welcome",
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Text(
                                    "back,",
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Text(
                                      "Becks++",
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 0.15 * height,
                  alignment: Alignment.center,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.1 * width),
                        Text("Today's",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.1 * width),
                        Text("recommendations",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ])),
              Container(
                height: 0.25 * height,
                alignment: Alignment.center,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height / 2,
                    enlargeCenterPage: true,
                    viewportFraction: 2.0,
                  ),
                  items: patientCellsList,
                ),
              )
            ],
          )),
    );
  }
}

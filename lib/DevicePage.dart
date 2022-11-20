import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import 'main.dart';

class DevicePage extends StatefulWidget {
  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    height: height * 0.25,
                    child: Image.asset('assets/sfera.jpeg'),
                  ),
                  Container(
                    height: height * 0.15,
                    padding: EdgeInsets.only(left: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Provider",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            SizedBox(height: 0.1 * height),
            eu
                ? Container(
              height: 0.5 * height,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 0.35 * height,
                    child: LayoutBuilder(builder: (context, constraint) {
                      return new Image.asset('assets/device.png');
                    }),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 80,),
                    child: Text(
                      "Fitbit Versa 3",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
                : GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          backgroundColor:
                          Color.fromRGBO(117, 142, 205, 0.5),
                          title: Column(children: [
                            SizedBox(
                              width: 0.5 * width,
                              height: 0.06 * height,
                              child: Row(children: [
                                Image(
                                    image: AssetImage(
                                        'assets/Fitbit-Logo.png')),
                                SizedBox(width: 0.023 * width),
                                SizedBox(
                                    width: 0.37 * width,
                                    height: 0.06 * height,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.cyan),
                                      // set the background color)
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          eu = true;
                                        });
                                      },
                                      child: Text(
                                        "Fitbit",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ))
                              ]),
                            ),
                            SizedBox(
                              height: 0.02 * height,
                            ),
                            SizedBox(
                              width: 0.5 * width,
                              height: 0.06 * height,
                              child: Row(children: [
                                Image(
                                    image: AssetImage(
                                        'assets/samsung_logo.jpg')),
                                SizedBox(
                                  width: 0.015 * width,
                                ),
                                SizedBox(
                                    width: 0.37 * width,
                                    height: 0.06 * height,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                              20,
                                              40,
                                              160,
                                              1)), // set the background color)
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          eu = true;
                                        });
                                      },
                                      child: Text(
                                        "Samsung",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ))
                              ]),
                            ),
                            SizedBox(
                              height: 0.02 * height,
                            ),
                            SizedBox(
                              width: 0.5 * width,
                              height: 0.06 * height,
                              child: Row(children: [
                                Image(
                                    image: AssetImage(
                                        'assets/Huawei-Logo.png')),
                                SizedBox(
                                  width: 0.025 * width,
                                ),
                                SizedBox(
                                    width: 0.37 * width,
                                    height: 0.06 * height,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromRGBO(
                                              207, 10, 44, 1)),
                                      // set the background color)
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          eu = true;
                                        });
                                      },
                                      child: Text(
                                        "Fitbit smartwatch",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ))
                              ]),
                            )
                          ]));
                    });
              },
              child: Container(
                height: 0.5 * height,
                child: Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(left: 80,),
                      child: Text(
                        "You don't have any device connected",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 0.25 * height,
                      child:
                      LayoutBuilder(builder: (context, constraint) {
                        return new Icon(
                          Icons.add_circle_outline_rounded,
                          size: constraint.biggest.height,
                          color: Colors.black.withOpacity(0.25),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
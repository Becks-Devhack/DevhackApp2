import 'package:flutter/material.dart';

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
                    height: 0.41 * height,
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
                      setState(() {
                        eu = true;
                        print(eu);
                      });
                    },
                    child: Container(
                      height: 0.31 * height,
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

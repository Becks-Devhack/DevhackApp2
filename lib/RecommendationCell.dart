import 'package:flutter/material.dart';
import 'Recommendation.dart';

class PatientCell extends StatelessWidget {
  const PatientCell(
      {required this.width, required this.height, required this.patient});

  final double width;
  final double height;
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          // color: Colors.blue,
          height: 0.2 * height,
          width: width * 0.8,
          decoration: BoxDecoration(
              color: Color(0xFF3F826D).withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 0.11 * height,
                width: width * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(patient.imageUrl),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(patient.fullName, style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                    Text("Discount: ${patient.discount}%", style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => {},
    );
  }
}

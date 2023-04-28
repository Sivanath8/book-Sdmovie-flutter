import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToMain();
  }

  navigateToMain() async {
    await Future.delayed(Duration(milliseconds: 40000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 400,
        height: 781,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 400,
                  height: 781,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Color(0xff0F1924).withOpacity(0.95),
                      BlendMode.srcATop,
                    ),
                    child: Image.asset(
                      'image/MS-Dhoni.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 147.0, left: 39.0),
                  width: 119.0,
                  height: 179.0,
                  child: Transform.rotate(
                    angle: 345 * pi / 180,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'image/Theeran.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200.0, left: 193.0),
                  width: 129.0,
                  height: 72.0,
                  child: Transform.rotate(
                    angle: 345 * pi / 180,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'image/MS-Dhoni.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 341.0, left: 79.0),
                  width: 126.0,
                  height: 71.0,
                  child: Transform.rotate(
                    angle: 345 * pi / 180,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'image/Vikram.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 291.0, left: 233.0),
                  width: 137.0,
                  height: 150.0,
                  child: Transform.rotate(
                    angle: 345 * pi / 180,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'image/Naruto-Shippuuden.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 480.0, left: 122),
                  child: Image.asset('image/Group 12.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 593.0, left: 109),
                  child: Text(
                    "One ticket for endless \n         memories",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0XffFFFCFC)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 661.0, left: 155.0),
                  child: Icon(
                    Icons.circle_outlined,
                    color: Color(0XffD6346C),
                    size: 85,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFED8E5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  margin: EdgeInsets.only(top: 673.0, left: 167.0),
                  child: Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Color(0xFFD6346C),
                    size: 60.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

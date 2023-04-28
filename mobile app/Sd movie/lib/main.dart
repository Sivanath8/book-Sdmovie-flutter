import 'package:flutter/material.dart';
import 'package:textbutton/Splash.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController LogController1 = TextEditingController();
  TextEditingController LogController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                child: Image.asset('image/MS-Dhoni.jpg'),
              ),
              Container(
                width: double.infinity,
                height: 422.0,
                margin: EdgeInsets.only(top: 310.0),
                decoration: BoxDecoration(
                    color: Color(0XffFFFFFF),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 154.0, top: 20.0),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color(0xff0F1924),
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "MobileNumber",
                                  style: TextStyle(
                                      color: Color(0Xff0F1924),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 370,
                                margin: EdgeInsets.only(top: 7.0),
                                child: TextField(
                                  controller: LogController1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Color(0Xff707070),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0Xff707070),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Color(0Xff0F1924),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 370,
                                margin: EdgeInsets.only(top: 7.0),
                                child: TextField(
                                  controller: LogController1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: BorderSide(
                                        color: Color(0Xff707070),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0Xff707070),
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 370,
                                height: 50,
                                margin: EdgeInsets.only(top: 38.0),
                                child: ElevatedButton(
                                  child: Text('Login'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0XffD6346C),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 68,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF0F1924),
                borderRadius: BorderRadius.circular(30)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                      color: Color(0XffFFFFFF),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.image_search,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.chat_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

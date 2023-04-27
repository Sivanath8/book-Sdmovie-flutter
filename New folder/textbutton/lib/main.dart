import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textbutton/movies.dart';
import 'package:http/http.dart' as http;

import 'Theaters.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  TextEditingController RegController = TextEditingController();
  TextEditingController RegController1 = TextEditingController();
  TextEditingController RegController2 = TextEditingController();

  num get StarIcons => 2;
  num get staricon1 => 3;

  Future<void> showLoginDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: 560.0,
          height: 552.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 103.0, left: 0.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFFD6346C),
                    fontSize: 35.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                width: 344,
                margin: EdgeInsets.only(top: 26.0, left: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20.0),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Mobile Number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF707070),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 344.0,
                margin: EdgeInsets.only(top: 21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20.0),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: _controller1,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF707070),
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String mobileNumber = _controller.text;
                        String password = _controller1.text;
                        Map<String, dynamic> requestBody = {
                          'phone_number': mobileNumber,
                          'cus_Password': password,
                        };
                        String requestBodyJson = json.encode(requestBody);
                        print(requestBodyJson);

                        final response = await http.post(
                          Uri.parse('http://localhost:8080/movie/Movies'),
                          headers: {
                            'Content-Type': 'application/json',
                          },
                          body: requestBodyJson,
                        );
                        Map<String, dynamic> responseBody =
                            json.decode(response.body);
                        var name = responseBody['name'];
                        var status = responseBody['status'];
                        var id = responseBody['id'];
                        print('Name: $name');
                        print('Status: $status');
                        print('id:$id');

                        if (status == '201') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Movies(username: name, id: id)),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content:
                                  Text('Failed to login. Please try again.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                          minimumSize: Size(350.0, 50.0),
                          backgroundColor: Color(0xffD6346C)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> ShowRegisterDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: 552.0,
          height: 643.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 102.0),
                child: Text(
                  'Registartion',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 35.0,
                    color: Color(0xFFD6346C),
                  ),
                ),
              ),
              Container(
                width: 344,
                margin: EdgeInsets.only(top: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0XFF0F1924),
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: RegController,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 344,
                margin: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Color(0xFF0F1924),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: RegController1,
                      decoration: InputDecoration(
                        hintText: 'Enter your mobile number',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF707070),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 344,
                margin: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Password',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        color: Color(0xFF0F1924),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      controller: RegController2,
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF707070),
                              style: BorderStyle.solid,
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF707070),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String name = RegController.text;
                        String mobileNumber = RegController1.text;
                        String password = RegController2.text;
                        Map<String, dynamic> requestBody = {
                          'user_name': name,
                          'phone_number': mobileNumber,
                          'cus_Password': password,
                        };
                        String requestBodyJson = json.encode(requestBody);
                        print(requestBodyJson);

                        final response = await http.post(
                          Uri.parse('http://localhost:8080/movie/Customers'),
                          headers: {
                            'Content-Type': 'application/json',
                          },
                          body: requestBodyJson,
                        );
                        Map<String, dynamic> responseBody =
                            json.decode(response.body);
                        var status = responseBody['status'];
                        print('Status: $status');

                        if (status == '201') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'Your Already Register Please Login',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'Your Resister Successfully Please Login',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: Text('Registration'),
                      style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                          minimumSize: Size(350.0, 50.0),
                          backgroundColor: Color(0xffD6346C)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 149.0, top: 0.0),
            child: Image.asset(
              'image/Group 12.png',
            ),
          ),
          toolbarHeight: 100.0,
          backgroundColor: Color(0xFF0F1924),
          actions: <Widget>[
            ButtonBar(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 40.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Admin'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Robato'),
                      onPrimary: Color(0xFFF8FCFF),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 40.0),
                  child: ElevatedButton(
                    onPressed: () {
                      showLoginDialog(context);
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      minimumSize: Size(147, 50),
                      primary: Color(0xFFFFFFFF),
                      onPrimary: Color(0xFF0F1924),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 109.0),
                  child: ElevatedButton(
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                      minimumSize: Size(147, 50),
                      primary: Color(0xFF0F1924),
                      side: BorderSide(
                        width: 2.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      ShowRegisterDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  //SEARCH BAR WILL START FROM HERE
                  Container(
                    height: 50,
                    width: 1008,
                    margin: EdgeInsets.only(top: 30.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Movies,Theaters',
                        suffixIcon: Icon(Icons.search),
                        iconColor: Colors.black54,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black87,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  //TRENDING HEADER START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 140.0, top: 27.0),
                        child: const Text(
                          "Trending",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  //TRENDING MOVIES IMAGES WILL START
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 149.0, top: 16.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('image/Theeran.jpg',
                                    fit: BoxFit.cover)),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 159.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '01',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'image/Vikram.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '02',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('image/VIP-300x300.jpeg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '03',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                  'image/related-section-image-ponniyin-selvan-1-7.jpg',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '04',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('image/ayan.jpg',
                                    fit: BoxFit.fill)),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '05',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //TRENDING MOVIE NAMES AND ITS THEIR TYPE START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 20.0),
                        child: Text(
                          'Theeran',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 154.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Vikram',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 188.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'VIP',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 214.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Ponniyin Selvan',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 86.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Ayan',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 204.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                    ],
                  ),
                  //TRENDING MOVIES STARRATING AND ADD CIRCLE
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 160.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //TOP 10 MOVIE LIST HEADING WILL START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 30.0),
                        child: Text(
                          'Top 10 Movie List',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                      )
                    ],
                  ),
                  //TOP 10 MOVIE LIST MOVIE IMGAES WILL START AND THEIR COUNT START
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 149.0, top: 16.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('image/naruto.jpg',
                                    fit: BoxFit.cover)),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 159.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '01',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'image/MS-Dhoni.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '02',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('image/noorie.jpg',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '03',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('image/sivanagam.jpg',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '04',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                    'image/Naruto-Shippuuden.jpg',
                                    fit: BoxFit.fill)),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '05',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // TOP 10 MOVIE LIST MOVIE NAME WILL START AND THRIE TYPE START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 20.0),
                        child: Text(
                          'Naruto',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 168.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 20.0),
                        child: Text(
                          'Ms-Dhoni',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 154.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 20.0),
                        child: Text(
                          'Noorie',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 174.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 44.0, top: 20.0),
                        child: Text(
                          'SivaNagam',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 134.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50.0, top: 20.0),
                        child: Text(
                          'Naruto_shippuuden',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 64.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                    ],
                  ),
                  //TRENDING STAR AND ADD CIRCLE ICON START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < staricon1 ? Icons.star : Icons.star_border,
                                color: i < staricon1
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < staricon1 ? Icons.star : Icons.star_border,
                                color: i < staricon1
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 160.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < staricon1 ? Icons.star : Icons.star_border,
                                color: i < staricon1
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < staricon1 ? Icons.star : Icons.star_border,
                                color: i < staricon1
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < staricon1 ? Icons.star : Icons.star_border,
                                color: i < staricon1
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //RECOMMENDED HEADING
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 140.0, top: 27.0),
                        child: const Text(
                          "Recommended",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  //RECOMMENDED MOVIES IMAGES WILL START
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 149.0, top: 16.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('image/Theeran.jpg',
                                    fit: BoxFit.cover)),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 159.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '01',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'image/Vikram.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                            width: 299.0,
                            height: 345.0,
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '02',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset('image/VIP-300x300.jpeg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '03',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                  'image/related-section-image-ponniyin-selvan-1-7.jpg',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '04',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 54.0, top: 16.0),
                            width: 299.0,
                            height: 345.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('image/ayan.jpg',
                                    fit: BoxFit.fill)),
                          ),
                          const Positioned(
                            top: 28.0,
                            left: 64.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16.0,
                              child: Text(
                                '05',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  //RECOMMENDED MOVIE NAMES AND ITS THEIR TYPE START
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 20.0),
                        child: Text(
                          'Theeran',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 154.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Vikram',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 188.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'VIP',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 214.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Ponniyin Selvan',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 86.0, top: 22.0),
                        child: Text(
                          'Historical',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60.0, top: 20.0),
                        child: Text(
                          'Ayan',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF0F1924,
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 204.0, top: 22.0),
                        child: Text(
                          'Action',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF6B7E93,
                              )),
                        ),
                      ),
                    ],
                  ),
                  //RECOMMENDED MOVIES STARRATING AND ADD CIRCLE
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 149.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 160.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 54.0, top: 10.0),
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i < StarIcons ? Icons.star : Icons.star_border,
                                color: i < StarIcons
                                    ? Color(0xFFF26F20)
                                    : Color(0xFFF26F20),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 154.0, top: 13.0),
                            child: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

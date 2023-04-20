import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  num get StarIcons => 2;
  num get staricon1 => 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false,
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
                  margin: EdgeInsets.only(right: 54.0),
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
                  width: 52.0,
                  height: 52.0,
                  margin: EdgeInsets.only(right: 204.44),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(),
    );
  }
}

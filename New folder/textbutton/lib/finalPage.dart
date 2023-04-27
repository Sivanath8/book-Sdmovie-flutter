import 'package:flutter/material.dart';
import 'package:textbutton/main.dart';

class FinalPage extends StatefulWidget {
  final String username;
  final String movieName;
  final String showTimig;
  final String TheaterName;
  final int totalAmount;
  final int id;
  final String movieBackground;

  const FinalPage(
      {Key? key,
      required this.username,
      required this.movieName,
      required this.showTimig,
      required this.TheaterName,
      required this.totalAmount,
      required this.id,
      required this.movieBackground})
      : super(key: key);

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      int seats = (widget.totalAmount / 260).floor();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Container(
                  width: 568.0,
                  height: 411.0,
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Text(
                          "Movie Ticket Order Details",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFD6346C),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 17.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    'Movie Name',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    widget.movieName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Theater',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    widget.TheaterName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Seats',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    seats.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Show Time',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    widget.showTimig,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Total Amount',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "Rs." +
                                        widget.totalAmount.toString() +
                                        ".00",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Ticket Id',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    widget.id.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 155,
                              height: 50,
                              margin: EdgeInsets.only(top: 30, left: 207.0),
                              child: ElevatedButton(
                                child: Text(
                                  'Ok',
                                  style: TextStyle(color: Color(0XffFFFFFF)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyApp()));
                                },
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1.0, color: Color(0XffD6346C)),
                                    backgroundColor: Color(0XffD6346C),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 55,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 100.0, left: 10.0),
                child: Text(
                  "Hi ," + widget.username,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFFFFFFFF)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 519,
                    width: 1661,
                    color: Colors.green,
                    margin: EdgeInsets.symmetric(horizontal: 130),
                    child: Image.network(
                      widget.movieBackground,
                      fit: BoxFit.fill,
                    ),
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

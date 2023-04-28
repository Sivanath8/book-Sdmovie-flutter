import 'package:flutter/material.dart';
import 'package:textbutton/modal/TheatersDetails.dart';

import 'api/TheaterDetails.dart';
import 'finalPage.dart';
import 'main.dart';
import 'modal/MovieDetails.dart';

class TheatersDetails extends StatefulWidget {
  final String moviename;
  final String username;
  final int id;
  final String movieBackground;

  const TheatersDetails({
    Key? key,
    required this.moviename,
    required this.username,
    required this.id,
    required this.movieBackground,
  }) : super(key: key);

  @override
  State<TheatersDetails> createState() => _TheatersDetailsState();
}

class _TheatersDetailsState extends State<TheatersDetails> {
  int amount = 0;

  Future<void> showSeatsDialog(
      BuildContext context, showTiming, String theaterName) async {
    String? valueChoose;
    List<String> listItem = ['1', '2', '3', '4', '5'];

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Container(
                width: 560.0,
                height: 552.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70.0, left: 183.0),
                      child: Text(
                        "How Many Seats",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFD6346C),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 105.0, top: 35.0),
                      child: Container(
                        child: Text(
                          "Seats",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20.0,
                            color: Color(0xFF0F1924),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 344,
                      height: 50,
                      margin: EdgeInsets.only(left: 108, top: 8.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: .5),
                              borderRadius: BorderRadius.zero),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: .5),
                              borderRadius: BorderRadius.zero),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Color(0XFFFFFFFF),
                        hint: Text('Select Seats'),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue.toString();
                            amount = int.parse(valueChoose.toString()) * 250;
                          });
                        },
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 108.0, top: 25.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10.0),
                            width: 154,
                            height: 86,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                  color: Color(0XFF6E6E6E)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "DIAMOND",
                                    style: TextStyle(
                                        color: Color(0xFF6E6E6E),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'RS.190.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Color(0Xff0F1924)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Available",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff32900F)),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 35.0),
                            padding: EdgeInsets.only(top: 10.0),
                            width: 154,
                            height: 86,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                  color: Color(0XFF6E6E6E)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "GOLD",
                                    style: TextStyle(
                                        color: Color(0xFF6E6E6E),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'RS.190.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Color(0Xff0F1924)),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "Sold Out",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xffFF0000)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 344,
                      height: 50,
                      margin: EdgeInsets.only(left: 108.0, top: 21.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, color: Color(0XFFD6346C)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Amount Payable+GST ",
                                style: TextStyle(
                                    color: Color(0XFF0F1924),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Rs.${amount.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Color(0XFF0F1924)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 105.0, top: 20.0),
                      width: 344,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          "continue",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0XffD6346C)),
                        onPressed: () {
                          showOrdersDialog(
                              context, showTiming, theaterName, amount);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> showOrdersDialog(
    BuildContext context,
    showTiming,
    theaterName,
    int amount,
  ) async {
    String? valueChoose;
    List listItem = ["GPAY", "PHONE PAY", "PAYTM"];
    int totalAmount = int.parse(amount.toString()) + 50;
    bool isTextFieldEnabled = false;
    String upiId = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Container(
                width: 560.0,
                height: 550.0,
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
                        "Order Summary",
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
                                  widget.moviename,
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
                                  'Date & Time',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  showTiming,
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
                                  'Plan Amount',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Rs.${amount.toString()}.00",
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
                                  'Transcation Fees',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  'Rs.50.00',
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
                                  "Rs.${totalAmount.toString()}.00",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.black12,
                            height: 25,
                            thickness: 3,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Container(
                            child: Text(
                              "Select Payment Method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0XffD6346C)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: .5),
                                    borderRadius: BorderRadius.zero),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: .5),
                                    borderRadius: BorderRadius.zero),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              hint: Text('UPI Apps'),
                              value: valueChoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue.toString();
                                  isTextFieldEnabled = true;
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text('UPI ID'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter UPI ID',
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                        style: BorderStyle.solid)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.zero),
                              ),
                              enabled: isTextFieldEnabled,
                              onChanged: (value) {
                                setState(() {
                                  upiId = value;
                                });
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                width: 130,
                                height: 50,
                                child: OutlinedButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Color(0XffD6346C)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          width: 1.0, color: Color(0XffD6346C)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                ),
                              ),
                              Container(
                                width: 155,
                                height: 50,
                                margin: EdgeInsets.only(top: 20, left: 274.0),
                                child: ElevatedButton(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(color: Color(0XffFFFFFF)),
                                  ),
                                  onPressed: upiId.trim().isEmpty
                                      ? null // Disable the button if the trimmed UPI ID is empty
                                      : () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => FinalPage(
                                                      username: widget.username,
                                                      movieName:
                                                          widget.moviename,
                                                      showTimig: showTiming,
                                                      TheaterName: theaterName,
                                                      totalAmount: totalAmount,
                                                      id: widget.id,
                                                      movieBackground: widget
                                                          .movieBackground,
                                                    )),
                                          );
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
  }

  final theaters = TheatersDetailsGet();
  List<Theater> theater = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      Empty2 empty = await theaters.getTheaters();
      setState(() {
        theater = empty.theaters;
      });
    } catch (e) {
      print('Error fetching movie details: $e');
    }
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
                margin: EdgeInsets.only(right: 34.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 257,
                    width: 2000,
                    color: Color(0xFFD6346C),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 1008,
                          margin: EdgeInsets.only(left: 456.0, top: 30.0),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search Movies,Theaters',
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                              ),
                              filled: true,
                              fillColor: Colors.white,
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
                                  width: 1.0,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(40.0, 15.0, 20.0, 15.0),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 149.0, top: 27.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  widget.moviename,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 45.0,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  ' - Tamil, English',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 35.0,
                                      color: Color(0xFFFFFFFF)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 443,
                          height: 40,
                          margin: EdgeInsets.only(left: 150, top: 21.0),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Text(
                                  "Action",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFD6346C)),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Drama",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFD6346C)),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "U/13+",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFD6346C)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150, top: 31.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Theaters",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Color(0xFF0F1924)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: Container(
                      margin: EdgeInsets.only(left: 108, top: 18.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: theater.length < 5 ? theater.length : 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: 42.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 299.0,
                                  height: 173.0,
                                  child: Image.network(
                                    theater[index].theaterImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    theater[index].theaterName,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF0F1924)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    children: [
                                      for (var i = 0; i < 5; i++)
                                        Icon(
                                          i <
                                                  int.parse(
                                                      theater[index].starCount)
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: i <
                                                  int.parse(
                                                      theater[index].starCount)
                                              ? Color(0xFFF26F20)
                                              : Color(0xFFF26F20),
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 137.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(top: 18.0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            showSeatsDialog(
                                                context,
                                                theater[index].showTime1,
                                                theater[index].theaterName);
                                          },
                                          child: Text(
                                            "     " +
                                                theater[index].showTime1 +
                                                "                   4k DOLBY 7.1",
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.green, // Text color
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF6E6E6E)),

                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ), // Border color
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 137.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(
                                            top: 18.0, left: 25.0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            showSeatsDialog(
                                                context,
                                                theater[index].showTime2,
                                                theater[index].theaterName);
                                          },
                                          child: Text(
                                            "     " +
                                                theater[index].showTime2 +
                                                "                   4k DOLBY 7.1",
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary:
                                                Color(0xFFFF8014), // Text color
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF6E6E6E)),

                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ), // Border color
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: Container(
                      margin: EdgeInsets.only(left: 108, top: 18.0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: theater.length < 5 ? theater.length : 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: 42.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 299.0,
                                  height: 173.0,
                                  child: Image.network(
                                    theater[index].theaterImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    theater[index].theaterName,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF0F1924)),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    children: [
                                      for (var i = 0; i < 5; i++)
                                        Icon(
                                          i <
                                                  int.parse(
                                                      theater[index].starCount)
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: i <
                                                  int.parse(
                                                      theater[index].starCount)
                                              ? Color(0xFFF26F20)
                                              : Color(0xFFF26F20),
                                          size: 24,
                                        ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 137.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(top: 18.0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            showSeatsDialog(
                                                context,
                                                theater[index].showTime1,
                                                theater[index].theaterName);
                                          },
                                          child: Text(
                                            "     " +
                                                theater[index].showTime1 +
                                                "                   4k DOLBY 7.1",
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary: Colors.green, // Text color
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF6E6E6E)),

                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ), // Border color
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 137.0,
                                        height: 60.0,
                                        margin: EdgeInsets.only(
                                            top: 18.0, left: 25.0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            showSeatsDialog(
                                                context,
                                                theater[index].showTime2,
                                                theater[index].theaterName);
                                          },
                                          child: Text(
                                            "     " +
                                                theater[index].showTime2 +
                                                "                   4k DOLBY 7.1",
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            primary:
                                                Color(0xFFFF8014), // Text color
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFF6E6E6E)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.zero,
                                            ), // Border color
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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

import 'package:flutter/material.dart';

import 'Theaters.dart';
import 'api/MovieDetails.dart';
import 'modal/MovieDetails.dart';
import 'movieDetails.dart';

class MovieDetails extends StatefulWidget {
  final String movieId;
  final String username;
  final int id;
  const MovieDetails(
      {required this.movieId,
      required this.username,
      Key? key,
      required this.id})
      : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final specificMovie = SpecificMovie();
  List<AllMovie> oneMovie = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      Empty1 empty = await specificMovie.selectMovies(widget.movieId);
      setState(() {
        oneMovie = empty.allMovie;
        print(oneMovie[0].movieNames);
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
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(left: 149.0),
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
                    Container(
                      color: Colors.blue,
                      width: 1661,
                      height: 519,
                      margin: EdgeInsets.only(top: 34.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    oneMovie[0].movieBackground,
                                    width: 1661,
                                    height: 519,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 20.0, left: 118.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xFFD6346C),
                                        width: 5.0,
                                      ),
                                    ),
                                    child: Image.network(
                                      oneMovie[0].frontImage,
                                      width: 356,
                                      height: 478,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 526.0, top: 36.0),
                                    child: Text(
                                      oneMovie[0].movieNames,
                                      style: TextStyle(
                                        fontSize: 45.0,
                                        color: Color(0xffFFFFFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 221,
                                    height: 40,
                                    margin: EdgeInsets.only(
                                        left: 526.0, top: 125.0),
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          child: Text(
                                            '2D',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Color(0xFF0F1924)),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "Tamil,English",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0,
                                                color: Color(0xFF0F1924)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 188.0, left: 526.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.star_border,
                                            size: 30.0,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            '9/10',
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 250.0, left: 526.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            oneMovie[0].movieAbout,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20.0,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            ", " + oneMovie[0].movieDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20.0,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 304, left: 526),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            oneMovie[0].movieCategory,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 360.0, left: 526.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            "Major Cast : ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            oneMovie[0].cast,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 221,
                                    margin:
                                        EdgeInsets.only(left: 526, top: 433),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        String movieName =
                                            oneMovie[0].movieNames;
                                        String movieBackground =
                                            oneMovie[0].movieBackground;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TheatersDetails(
                                              moviename: movieName,
                                              movieBackground: movieBackground,
                                              username: widget.username,
                                              id: widget.id,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Book Tickets',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFFFFF)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 180,
                      width: 1661,
                      margin: EdgeInsets.only(top: 31.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "About Movie",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0,
                                  color: Color(0xFF0F1924)),
                            ),
                          ),
                          Container(
                            child: Text(
                              oneMovie[0].aboutMovie,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF000000)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

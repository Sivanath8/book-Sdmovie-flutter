import 'dart:convert';

import 'package:flutter/material.dart';

import 'api/AllMovie.dart';

import 'modal/Movies.dart';
import 'movieDetails.dart';

class Movies extends StatefulWidget {
  final String username;
  final int id;

  const Movies({Key? key, required this.username, required this.id})
      : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final movieDetails = Allmovies();
  List<Movie> moviesList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Empty empty = await movieDetails.getMovies();
    setState(() {
      moviesList = empty.movies;
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
                      child: Row(
                        children: [
                          Text(
                            "Movies",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 500.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            moviesList.length < 5 ? moviesList.length : 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 360.0,
                                    height: 420.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 299.0,
                                          height: 345.0,
                                          child: GestureDetector(
                                            onTap: () {
                                              String movieId =
                                                  moviesList[index].movieId;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetails(
                                                    movieId: movieId,
                                                    username: widget.username,
                                                    id: widget.id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                moviesList[index].movieImages,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 299.0,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  moviesList[index].movieNames,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  moviesList[index].movieType,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF6B7E93),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i <
                                                          int.parse(
                                                              moviesList[index]
                                                                  .starCount)
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  color: i <
                                                          int.parse(
                                                              moviesList[index]
                                                                  .starCount)
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 24,
                                                ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 154),
                                                child: Icon(
                                                    Icons.add_circle_outline),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    left: 10.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 16.0,
                                      child: Text(
                                        moviesList[index].movieCount,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 500.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            moviesList.length > 5 ? moviesList.length - 5 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 360.0,
                                    height: 420.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 299.0,
                                          height: 345.0,
                                          child: GestureDetector(
                                            onTap: () {
                                              String movieId =
                                                  moviesList[index + 5].movieId;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetails(
                                                    movieId: movieId,
                                                    username: widget.username,
                                                    id: widget.id,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                moviesList[index + 5]
                                                    .movieImages,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 299.0,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  moviesList[index + 5]
                                                      .movieNames,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF0F1924),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  moviesList[index + 5]
                                                      .movieType,
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF6B7E93),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var i = 0; i < 5; i++)
                                                Icon(
                                                  i <
                                                          int.parse(moviesList[
                                                                  index + 5]
                                                              .starCount)
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  color: i <
                                                          int.parse(moviesList[
                                                                  index + 5]
                                                              .starCount)
                                                      ? Color(0xFFF26F20)
                                                      : Color(0xFFF26F20),
                                                  size: 24,
                                                ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 154),
                                                child: Icon(
                                                    Icons.add_circle_outline),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    left: 10.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 16.0,
                                      child: Text(
                                        moviesList[index + 5].movieCount,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
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

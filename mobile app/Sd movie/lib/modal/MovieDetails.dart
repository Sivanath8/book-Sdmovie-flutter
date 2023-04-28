// To parse this JSON data, do
//
//     final empty1 = empty1FromJson(jsonString);

import 'dart:convert';

Empty1 empty1FromJson(String str) => Empty1.fromJson(json.decode(str));

String empty1ToJson(Empty1 data) => json.encode(data.toJson());

class Empty1 {
  Empty1({
    required this.allMovie,
  });

  List<AllMovie> allMovie;

  factory Empty1.fromJson(Map<String, dynamic> json) => Empty1(
        allMovie: List<AllMovie>.from(
            json["allMovie"].map((x) => AllMovie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allMovie": List<dynamic>.from(allMovie.map((x) => x.toJson())),
      };
}

class AllMovie {
  AllMovie({
    required this.movieNames,
    required this.movieId,
    required this.aboutMovie,
    required this.movieCategory,
    required this.movieBackground,
    required this.movieDate,
    required this.movieCount,
    required this.movieAbout,
    required this.movieImages,
    required this.cast,
    required this.starCount,
    required this.movieType,
    required this.frontImage,
  });

  String movieNames;
  int movieId;
  String aboutMovie;
  String movieCategory;
  String movieBackground;
  String movieDate;
  String movieCount;
  String movieAbout;
  String movieImages;
  String cast;
  int starCount;
  String movieType;
  String frontImage;

  factory AllMovie.fromJson(Map<String, dynamic> json) => AllMovie(
        movieNames: json["movie_names"],
        movieId: json["movie_id"],
        aboutMovie: json["about_movie"],
        movieCategory: json["movie_category"],
        movieBackground: json["movie_background"],
        movieDate: json["movie_date"],
        movieCount: json["movie_count"],
        movieAbout: json["movie_about"],
        movieImages: json["movie_Images"],
        cast: json["cast"],
        starCount: json["star_count"],
        movieType: json["movie_type"],
        frontImage: json["front_image"],
      );

  Map<String, dynamic> toJson() => {
        "movie_names": movieNames,
        "movie_id": movieId,
        "about_movie": aboutMovie,
        "movie_category": movieCategory,
        "movie_background": movieBackground,
        "movie_date": movieDate,
        "movie_count": movieCount,
        "movie_about": movieAbout,
        "movie_Images": movieImages,
        "cast": cast,
        "star_count": starCount,
        "movie_type": movieType,
        "front_image": frontImage,
      };
}

// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

Empty emptyFromJson(String str) => Empty.fromJson(json.decode(str));

String emptyToJson(Empty data) => json.encode(data.toJson());

class Empty {
  Empty({
    required this.movies,
  });

  List<Movie> movies;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
      };
}

class Movie {
  Movie({
    required this.movieType,
    required this.movieBackground,
    required this.frontImage,
    required this.movieId,
    required this.cast,
    required this.starCount,
    required this.movieAbout,
    required this.aboutMovie,
    required this.movieCategory,
    required this.movieCount,
    required this.movieNames,
    required this.movieImages,
    required this.movieDate,
  });

  String movieType;
  String movieBackground;
  String frontImage;
  String movieId;
  String cast;
  String starCount;
  String movieAbout;
  String aboutMovie;
  String movieCategory;
  String movieCount;
  String movieNames;
  String movieImages;
  String movieDate;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        movieType: json["movie_type"] ?? "",
        movieBackground: json["movie_background"] ?? "",
        frontImage: json["front_image"] ?? "",
        movieId: json["movie_id"].toString() ?? "",
        cast: json["cast"] ?? "",
        starCount: json["star_count"].toString() ?? "",
        movieAbout: json["movie_about"] ?? "",
        aboutMovie: json["about_movie"] ?? "",
        movieCategory: json["movie_category"] ?? "",
        movieCount: json["movie_count"] ?? "",
        movieNames: json["movie_names"] ?? "",
        movieImages: json["movie_Images"] ?? "",
        movieDate: json["movie_date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "movie_type": movieType,
        "movie_background": movieBackground,
        "front_image": frontImage,
        "movie_id": movieId,
        "cast": cast,
        "star_count": starCount,
        "movie_about": movieAbout,
        "about_movie": aboutMovie,
        "movie_category": movieCategory,
        "movie_count": movieCount,
        "movie_names": movieNames,
        "movie_Images": movieImages,
        "movie_date": movieDate,
      };
}

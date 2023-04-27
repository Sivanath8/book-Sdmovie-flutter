// To parse this JSON data, do
//
//     final empty2 = empty2FromJson(jsonString);

import 'dart:convert';

Empty2 empty2FromJson(String str) => Empty2.fromJson(json.decode(str));

String empty2ToJson(Empty2 data) => json.encode(data.toJson());

class Empty2 {
  Empty2({
    required this.theaters,
  });

  List<Theater> theaters;

  factory Empty2.fromJson(Map<String, dynamic> json) => Empty2(
        theaters: List<Theater>.from(
            json["Theaters"].map((x) => Theater.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Theaters": List<dynamic>.from(theaters.map((x) => x.toJson())),
      };
}

class Theater {
  Theater({
    required this.timeShow1,
    required this.movieType,
    required this.showTime2,
    required this.theaterImage,
    required this.showTime1,
    required this.movieNames,
    required this.theaterName,
    required this.starCount,
  });

  String timeShow1;
  String movieType;
  String showTime2;
  String theaterImage;
  String showTime1;
  String movieNames;
  String theaterName;
  String starCount;

  factory Theater.fromJson(Map<String, dynamic> json) => Theater(
        timeShow1: json["time_show1"] ?? "",
        movieType: json["movie_type"] ?? "",
        showTime2: json["show_time2"] ?? "",
        theaterImage: json["theater_image"] ?? "",
        showTime1: json["show_time1"] ?? "",
        movieNames: json["movie_names"] ?? "",
        theaterName: json["theater_name"] ?? "",
        starCount: json["star_count"].toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "time_show1": timeShow1,
        "movie_type": movieType,
        "show_time2": showTime2,
        "theater_image": theaterImage,
        "show_time1": showTime1,
        "movie_names": movieNames,
        "theater_name": theaterName,
        "star_count": starCount,
      };
}

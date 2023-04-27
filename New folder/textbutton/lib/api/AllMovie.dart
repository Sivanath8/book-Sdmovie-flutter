import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/Movies.dart';

class Allmovies {
  Future<Empty> getMovies() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/movie/AllMovies'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('siva');
      return Empty.fromJson(jsonDecode(response.body));
    } else {
      print('error');
      throw Exception('Failed to fetch movies');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/MovieDetails.dart';

class SpecificMovie {
  Future<Empty1> selectMovies(String movieId) async {
    Map<String, dynamic> requestBody = {"movie_id": movieId};
    String requestBodyJson = json.encode(requestBody);
    print(requestBodyJson);

    final response = await http.post(
      Uri.parse('http://localhost:8080/movie/MovieDetails'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestBodyJson,
    );
    if (response.statusCode == 200) {
      print('siva');
      return Empty1.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}

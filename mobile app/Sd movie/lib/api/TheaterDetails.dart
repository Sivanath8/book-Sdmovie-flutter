import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modal/TheatersDetails.dart';

class TheatersDetailsGet {
  Future<Empty2> getTheaters() async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/movie/showTheaters'),
      headers: {
        'Content-Type': 'application/json',
      },
      // body: requestBodyJson,
    );
    if (response.statusCode == 200) {
      print('sivanath');
      return Empty2.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}

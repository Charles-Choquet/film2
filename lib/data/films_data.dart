import 'dart:convert';

import 'package:http/http.dart' as http;

class FilmsData {
  final String authToken = "9bc605bc17a16c041bd16a1bdb9dd03c";

  Future<Map<String, dynamic>> getPopularFilms() async {
    var uri = Uri.https("api.themoviedb.org", "3/movie/popular",
        {"api_key": authToken, "language": "fr-FR"});

    var response = await http.get(uri);
    Map<String,dynamic> jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse;
  }
}
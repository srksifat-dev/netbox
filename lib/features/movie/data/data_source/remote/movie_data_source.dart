import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:netbox/core/constants/strings.dart';

import 'package:http/http.dart' as http;

import '../../model/movie_model.dart';
class MovieDataSource{
  Future<List<MovieModel>?> getMovies() async {
    final response = await http.get(Uri.parse("$baseUrl$searchShows$allShows"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      Fluttertoast.showToast(
          msg: "Failed to load movies",
      );
    }
    return null;
  }

  Future<List<MovieModel>?> searchMovies({String? params = allShows}) async {
    final response = await http.get(Uri.parse("$baseUrl$searchShows${params ?? allShows}"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      Fluttertoast.showToast(
          msg: "Failed to load movies",
      );
    }
    return null;
  }
}
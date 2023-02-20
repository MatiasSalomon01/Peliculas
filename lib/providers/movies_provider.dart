import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  String _apiKey = 'ac5ae6c4cd5f1879824c53774b00a510';
  //String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'en-US';

  MoviesProvider(){
    print('Movies Provider Inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
      var url = Uri.https(_baseUrl, '3/movie/now_playing', {
        'api_key': _apiKey,
        'language': _language,
        'page': '1'
      });

      var response = await http.get(url);
      final Map<String, dynamic> decodeData = json.decode(response.body);
      print(decodeData['results']);
  }

}

// import 'dart:convert' as convert;

// import 'package:http/http.dart' as http;

// void main(List<String> arguments) async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url =
//       Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse =
//         convert.jsonDecode(response.body) as Map<String, dynamic>;
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }
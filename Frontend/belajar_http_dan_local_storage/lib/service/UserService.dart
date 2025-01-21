import 'dart:convert';

import 'package:belajar_http_dan_local_storage/model/User/UserGetRequest.dart';
import 'package:belajar_http_dan_local_storage/model/User/UserPostRequest.dart';
import 'package:http/http.dart' as http;

class Userservice {
  // parsing response JSON
  List<Usergetrequest> parseUserResponse(dynamic responseBody) {
    if (responseBody is List) {
      return responseBody.map<Usergetrequest>((json) {
        return Usergetrequest.fromJson(json);
      }).toList();
    } else if (responseBody is Map<String, dynamic>) {
      return [Usergetrequest.fromJson(responseBody)];
    } else {
      throw Exception("Format tidak dikenal");
    }
  }

  // GET request
  Future<List<Usergetrequest>> getUser(String url,
      {String? paramKey, String? paramVal}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: {
        if (paramKey != null && paramVal != null) paramKey: paramVal
      });
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return parseUserResponse(data);
      } else {
        throw Exception('Gagal mendapatkan data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mendapatkan data: ${e}');
    }
  }

  // login
  Future<List<Usergetrequest>> login(
      String url, Map<String, String> parameters) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: parameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return parseUserResponse(data);
      } else {
        throw Exception('Gagal login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mendapatkan data: ${e}');
    }
  }

  // POST request
  Future<bool> createUser(Userpostrequest user, String url) async {
    final data = user.toJson();
    final uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data));

      if (response.statusCode == 200) {
        print("User registered: ${response.body}");
        return true;
      } else {
        print("Failed user registered: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error: ${e}");
      return false;
    }
  }
}

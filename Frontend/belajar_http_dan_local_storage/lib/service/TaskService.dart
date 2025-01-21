import 'package:belajar_http_dan_local_storage/model/Task/TaskGetRequest.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Taskservice {
  // parsing response JSON
  List<Taskgetrequest> parseTaskResponse(dynamic responseBody) {
    if (responseBody is List) {
      return responseBody.map<Taskgetrequest>((json) {
        return Taskgetrequest.fromJson(json);
      }).toList();
    } else if (responseBody is Map<String, dynamic>) {
      return [Taskgetrequest.fromJson(responseBody)];
    } else {
      throw Exception("Format tidak dikenal");
    }
  }

  // GET request
  Future<List<Taskgetrequest>> getTask(String url,
      {String? paramKey, String? paramVal}) async {
    try {
      final uri = Uri.parse(url).replace(queryParameters: {
        if (paramKey != null && paramVal != null) paramKey: paramVal
      });
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return parseTaskResponse(data);
      } else {
        throw Exception('Gagal mendapatkan data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saat mendapatkan data: ${e}');
    }
  }

  // PUT request
  Future<bool> updateStatus(String url, int taskId, bool status) async {
    try {
      final uri = Uri.parse("$url/$taskId");
      final response = await http.patch(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'status': status}));
      if (response.statusCode == 200) {
        print("Berhasil ubah status");
        return true;
      } else {
        print("Gagal ubah status");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

import 'package:belajar_http_dan_local_storage/model/Task/TaskGetRequest.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskPostRequest.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskPutRequest.dart';
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

  // post request
  Future<bool> createTask(Taskpostrequest task) async {
    try {
      final uri = Uri.parse("http://localhost:8080/api/tasks");
      final response = await http.post(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(task.toJson()));
      if (response.statusCode == 200) {
        print("Berhasil tambah task");
        return true;
      } else {
        print("Gagal tambah task: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // PUT request (status)
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

  // PATCH request
  Future<bool> updateTask(String url, int taskId, Taskputrequest task) async {
    try {
      final uri = Uri.parse("$url/$taskId");
      final response = await http.patch(uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(task.toJson()));
      if (response.statusCode == 200) {
        print("Berhasil update task");
        return true;
      } else {
        print("Gagal update task");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // DELETE request
  Future<bool> deleteTask(String url, int taskId) async {
    try {
      final uri =
          Uri.parse(url).replace(queryParameters: {"id": taskId.toString()});
      final response = await http.delete(uri);
      if (response.statusCode == 200) {
        print("Berhasil hapus task");
        return true;
      } else {
        print("Gagal hapus task");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

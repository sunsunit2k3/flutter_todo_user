import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvinder {
  final String _baseUrl =
      'https://crudcrud.com/api/0dd1361415d242be878968878426b2e3';
  get(String url) async {
    try {
      final res = await http.get(Uri.parse(_baseUrl + url));
      if (res.statusCode == 200) {
        final resJson = json.decode(res.body);
        return resJson;
      }
    } catch (e) {
      rethrow;
    }
  }

  post(String url, Map<String, dynamic> data) async {
    try {
      String jsonData = json.encode(data);
      final res =
          await http.post(Uri.parse(_baseUrl + url), body: jsonData, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
      if (res.statusCode == 201) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  put(String url, Map<String, dynamic> data) async {
    try {
      String jsonData = json.encode(data);
      final res =
          await http.put(Uri.parse(_baseUrl + url), body: jsonData, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  delete(String url) async {
    try {
      final res = await http.delete(Uri.parse(_baseUrl + url));
      if (res.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }
}

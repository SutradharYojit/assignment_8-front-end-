import 'dart:convert';
import 'dart:developer';
import 'package:assignment_8/services/services.dart';
import 'package:http/http.dart' as http;
// Class of the Api service , Define all the api functions Like GET, POST, PUT AND DELETE
class ApiServices {
  Future taskData({required String api}) async {
    try {
      http.Response response = await http.get(Uri.parse(api));
      log(response.statusCode.toString());
      if (response.statusCode == ServerStatusCodes.success) {
        var jsonData = jsonDecode(response.body)['data'];
        return jsonData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

//POST APi , Function to Send new Blog Data to the Database
  Future postApi({required String api, required Map<String, dynamic> data}) async {
    final response = await http.post(
      Uri.parse(api),
      body: data,
    );

    if (response.statusCode == ServerStatusCodes.addSuccess) {
      var jsonData = jsonDecode(response.body);
      log('Status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      return jsonData;
    } else {
      log('Failed to add task. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }

//DELETE Api , Function to delete Blog With Specific ID
  Future<void> deleteTask({required String api, required Map<String, dynamic> data}) async {
    final response = await http.post(Uri.parse(api), body: data);
    if (response.statusCode == ServerStatusCodes.addSuccess) {
      log('Blog with ID  has been deleted.');
      log('Response body: ${response.body}');
    } else {
      log('Failed to delete Task. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }


}

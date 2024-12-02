import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeesLogWidget extends StatelessWidget {
  // Function to send POST request with extended logging
  Future<void> _sendPostRequest() async {
    final url =
        Uri.parse('http://192.168.120.19:8080/employee/info'); // API URL
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'Keyword': 'strawberry shortcake'});

    print('Sending POST request to $url with body $body');

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Print response body if successful
        print('Response: ${response.body}');
      } else {
        // Enhanced error logging
        print('Failed to load data: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Enhanced exception handling
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees Log'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _sendPostRequest, // Trigger POST request on button press
          child: Text('Send POST Request'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EmployeesLogWidget(),
  ));
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

final String _apiKey = 'YOUR API KEY'; // Replace with your API key

Future<String> generateImage(String prompt) async {
  final url =
      'https://api.openai.com/v1/images/generations'; // Update to the correct endpoint

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    },
    body: jsonEncode({
      'model': 'dall-e-3',
      'prompt': prompt,
      'size': '1024x1024',
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['data'][0]
        ['url']; // Adjust according to the actual response format
  } else {
    throw Exception('Failed to generate image: ${response.body}');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

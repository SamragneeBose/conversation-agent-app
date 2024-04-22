import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:conversation_agent_app/constants/constants.dart';
import 'package:conversation_agent_app/models/chat_response.dart';
import 'package:conversation_agent_app/models/response_types.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiService {
  static Future<List<ChatResponse>> sendMessage(
      {required String message}) async {
    try {
      var response = await http.post(
        // Uri.parse(BASE_URL),
        BASE_URL as Uri,
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": message,
            },
          ],
          // "max_tokens": 100,
        }),
      );

      // Map jsonResponse = jsonDecode((response.body));
      Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));

      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }

      List<ChatResponse> chatList = [];
      if (jsonResponse["choices"].length > 0) {
        // log("jsonResponse[choices][0][text]: ${jsonResponse["choices"][0]["text"]}");
        chatList = List.generate(jsonResponse["choices"].length,
            (index) => ChatResponse(
                msg: jsonResponse["choices"][index]["message"]["content"],
                chatIndex: 1,
            ),
        );
      }

      return chatList;
    } catch (error) {
      log("Error: $error");
      rethrow;
    }
  }
}

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
        Uri.parse(BASE_URL),
        // BASE_URL as Uri,
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
        chatList = List.generate(
          jsonResponse["choices"].length,
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

  static Future<String> sendImage({
    required File image,
    int maxTokens = 50,
    String model = "gpt-4-turbo",//"gpt-4-vision-preview",
  }) async {
    final String base64Image = await encodeImage(image);

    try {
      final response = await http.post(
        Uri.parse(BASE_URL),
        headers: {
          "Authorization": "Bearer $API_KEY",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": model,
          "messages": [
            {
              "role": "system",
              "content": "Maintain strict accuracy.",
            },
            {
              "role": "user",
              "content": [
                {
                  "type": "text",
                  "text":
                      "Identify the content of the image whether it has text, graphs, tables, mathematical formulae, flowcharts and so on. Based on the type of content, extract all text along with any relevant information and inferences. Display the result accurately in a structured format."
                },
                {
                  "type": "image_url",
                  "image_url": {
                    "url": "data:image/jpeg;base64,$base64Image",
                  },
                },
              ],
            },
          ],
          // "max_tokens": maxTokens,
        }),
      );

      // final jsonResponse = response.body;
      Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));

      print(jsonResponse);

      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      return jsonResponse["choices"][0]["message"]["content"];
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  static Future<String> encodeImage(File image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }
}

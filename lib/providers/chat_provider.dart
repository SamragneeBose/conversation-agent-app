import 'package:flutter/foundation.dart';

import '../models/chat_response.dart';
import '../services/api_services.dart';

class ChatProvider with ChangeNotifier{
  List<ChatResponse> chatList=[];

  List<ChatResponse> get getChatList {
    return chatList;
  }

  void addUserMessage ({required String message}) {
    chatList.add(ChatResponse(msg: message , chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers({required String message}) async {
    chatList.addAll(
        await ApiService.sendMessage(
            message: message
        ),
    );
    notifyListeners();
  }

}
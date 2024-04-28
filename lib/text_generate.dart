
import 'dart:developer';

import 'package:conversation_agent_app/Constants/constants.dart';
import 'package:conversation_agent_app/providers/chat_provider.dart';
import 'package:conversation_agent_app/providers/response_provider.dart';
import 'package:conversation_agent_app/services/api_services.dart';
import 'package:conversation_agent_app/widgets/conversation_widget.dart';
import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'models/chat_response.dart';

class TextGenerate extends StatefulWidget {
  const TextGenerate({super.key});

  @override
  State<TextGenerate> createState() => _TextGenerateState();
}

class _TextGenerateState extends State<TextGenerate> {
  bool _isGenerating = false;
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _listScrollController;

  @override
  void initState() {
    // TODO: implement initState
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  // List<ChatResponse> chatList = [];

  @override
  Widget build(BuildContext context) {
    final responseProvider = Provider.of<ResponseProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        Flexible(
          flex: 2,
          child: ListView.builder(
              // controller: _listScrollController,
              itemCount: convMsg.length, //chatProvider.getChatList.length,
              itemBuilder: (context, index) {
                return ConversationWidget(
                  msg: //chatProvider.getChatList[index].msg,
                  convMsg[index]["msg"].toString(),
                  index: //chatProvider.getChatList[index].chatIndex,
                  int.parse(convMsg[index]["index"].toString()), //TODO Look into this
                );
              }),
        ),
        // if (_isGenerating) ...[
        //   SpinKitThreeBounce(
        //     color: Colors.deepPurple,
        //     size: 18,
        //   ),
        // ],
        // SizedBox(
        //   height: 15,
        // ),
        Material(
          color: Colors.deepPurple[50],
          child: Row(
            children: [
              Expanded(
                // child: Text(generatedText),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessageFCT(
                          chatProvider: chatProvider,
                          responseProvider: responseProvider);
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: "Ask Away!",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () async {
                    await sendMessageFCT(
                        chatProvider: chatProvider,
                        responseProvider: responseProvider);
                  },
                  icon: Icon(
                    Icons.send_rounded,
                    color: Colors.deepPurple,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  void scrollListToEnd() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn);
  }

  Future<void> sendMessageFCT(
      {required ResponseProvider responseProvider,
      required ChatProvider chatProvider}) async {

    if(_isGenerating || textEditingController.text.isEmpty) {
      return;
    }

    String msg=textEditingController.text;
    try {
      setState(() {
        _isGenerating = true;
        // chatList.add(ChatResponse(msg: textEditingController.text));
        chatProvider.addUserMessage(message: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      log("Request Sent");
      await chatProvider.sendMessageAndGetAnswers(
          message: msg);
      // chatList.addAll(
      //     await ApiService.sendMessage(message: textEditingController.text));
    } catch (error) {
      log("Error: $error");

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
            content: TextWidget(
              label: error.toString(),
              color: Colors.white,
          ),
            backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        scrollListToEnd();
        _isGenerating = false;
      });
    }
  }
}

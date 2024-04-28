
import 'dart:developer';
import 'dart:html';

import 'package:conversation_agent_app/Constants/constants.dart';
import 'package:conversation_agent_app/providers/chat_provider.dart';
import 'package:conversation_agent_app/providers/response_provider.dart';
import 'package:conversation_agent_app/providers/text_provider.dart';
import 'package:conversation_agent_app/services/api_services.dart';
import 'package:conversation_agent_app/widgets/conversation_widget.dart';
import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'models/chat_response.dart';

class TextGenerate2 extends StatefulWidget {
  const TextGenerate2({super.key});

  @override
  State<TextGenerate2> createState() => _TextGenerate2State();
}

class _TextGenerate2State extends State<TextGenerate2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
              // controller: _listScrollController,
              itemCount: convMsg.length, //chatProvider.getChatList.length,
              itemBuilder: (context, index) {
                return ConversationWidget(
                  msg: convMsg[index]["msg"].toString(), //chatProvider.getChatList[index].msg,
                  index: int.parse(convMsg[index]["index"].toString()), //TODO Look into this
                  // chatProvider.getChatList[index].chatIndex,
                );
              }),
        ),
      ],
    );
  }
}






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
    // textEditingController.text="Hello";
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

  void scrollListToEnd() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeIn);
  }

  Future<void> sendMessageFCT(
      {required ResponseProvider responseProvider,
        required ChatProvider chatProvider,
        required TextProvider textProvider}) async {

    if(_isGenerating) {
      return;
    }

    if(textEditingController.text.isEmpty && textProvider.getExtractedText().isEmpty) {
      return;
    }

    try {
      String msg="";

      if(textProvider.getExtractedText().isNotEmpty)
        msg+=textProvider.getExtractedText();

      if(textEditingController.text.isNotEmpty)
        msg+=" "+textEditingController.text;

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

  @override
  Widget build(BuildContext context) {
    final responseProvider = Provider.of<ResponseProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    final textProvider = Provider.of<TextProvider>(context);

    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: screenSize.height*0.60,
          child: ListView.builder(
              controller: _listScrollController,
              itemCount: chatProvider.getChatList.length,  //convMsg.length,
              itemBuilder: (context, index) {
                return ConversationWidget(
                  msg:  chatProvider.getChatList[index].msg,  //convMsg[index]["msg"].toString(),
                  index: chatProvider.getChatList[index].chatIndex,
                  // int.parse(convMsg[index]["index"].toString()), //TODO Look into this
                );
              }),
        ),
        if (_isGenerating) ...[
          SpinKitThreeBounce(
            color: Colors.deepPurple,
            size: 18,
          ),
        ],
        SizedBox(
          height: 15,
        ),
        Material(
          color: Colors.deepPurple[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessageFCT(
                          chatProvider: chatProvider,
                          responseProvider: responseProvider,
                        textProvider: textProvider,
                      );
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: "Ask Away!",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await sendMessageFCT(
                          chatProvider: chatProvider,
                          responseProvider: responseProvider,
                        textProvider: textProvider,
                      );
                    },
                    icon: Icon(
                      Icons.send_rounded,
                      color: Colors.deepPurple,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }


}

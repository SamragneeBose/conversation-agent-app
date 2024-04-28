import 'dart:js_interop';

import 'package:conversation_agent_app/constants/constants.dart';
import 'package:conversation_agent_app/image_select.dart';
import 'package:conversation_agent_app/providers/chat_provider.dart';
import 'package:conversation_agent_app/providers/text_provider.dart';
import 'package:conversation_agent_app/services/services.dart';
import 'package:conversation_agent_app/text_generate.dart';
import 'package:conversation_agent_app/widgets/conversation_widget.dart';
import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    final chatProvider = Provider.of<ChatProvider>(context);
    final textProvider = Provider.of<TextProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Away!"),
        backgroundColor: Colors.deepPurple[50],
        foregroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () async{
                await Services.showModalSheet(context: context);
              },
              icon: Icon(
            Icons.more_vert_rounded,
                color: Colors.grey[600],
          )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            chatProvider.clearChatLog();
            textProvider.clearExtractedText();
          });
        },
        child: Text("Clear"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.max,
            children: [
              ImageSelect(),
              TextGenerate(),
              // TextField(
              //   // focusNode: focusNode,
              //   style: TextStyle(
              //     color: Colors.deepPurple,
              //   ),
              //   // controller: textEditingController,
              //   // onSubmitted: (value) async {
              //   //   await sendMessageFCT(
              //   //       chatProvider: chatProvider,
              //   //       responseProvider: responseProvider);
              //   // },
              //   decoration: InputDecoration.collapsed(
              //       hintText: "Ask Away!",
              //       hintStyle: TextStyle(
              //         color: Colors.grey,
              //       )),
              // ),
              // IconButton(
              //     onPressed: () {
              //       },
              //     icon: Icon(
              //       Icons.send_rounded,
              //       color: Colors.deepPurple,
              //     ))

            ],
          ),
        ),
      ),
    );
  }
}

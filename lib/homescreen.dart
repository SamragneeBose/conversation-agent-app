import 'package:conversation_agent_app/constants/constants.dart';
import 'package:conversation_agent_app/image_select.dart';
import 'package:conversation_agent_app/services/services.dart';
import 'package:conversation_agent_app/text_generate.dart';
import 'package:conversation_agent_app/widgets/conversation_widget.dart';
import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Text("Clear"),
      // ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageSelect(),
            Flexible(
              child: ListView.builder(
                itemCount: convMsg.length,
                itemBuilder: (context, index) {
                  return ConversationWidget(
                    msg: convMsg[index]["msg"].toString(),
                    index: int.parse(convMsg[index]["index"].toString()),
                  );
              }),
            ),
            TextGenerate(),
          ],
        ),
      ),
    );
  }
}

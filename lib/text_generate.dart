import 'package:conversation_agent_app/Constants/constants.dart';
import 'package:flutter/material.dart';

class TextGenerate extends StatefulWidget {
  const TextGenerate({super.key});

  @override
  State<TextGenerate> createState() => _TextGenerateState();
}

class _TextGenerateState extends State<TextGenerate> {

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController=TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple[50],
      child: Row(
        children: [
          Expanded(
            // child: Text(generatedText),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
                controller: textEditingController,
                onSubmitted: (value){
                  //TODO send message
                },
                decoration: InputDecoration.collapsed(
                    hintText: "Ask Away!",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
                ),
              ),
            ),
      ),
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.send_rounded,
                color: Colors.deepPurple,
              )
          )
        ],
      ),
    );
  }
}

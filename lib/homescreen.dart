import 'package:conversation_agent_app/image_select.dart';
import 'package:conversation_agent_app/text_generate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Away!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Clear"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSelect(),
              TextGenerate(),
            ],
          ),
        ),
      ),
    );
  }
}

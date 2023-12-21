import 'package:flutter/material.dart';

class TextGenerate extends StatefulWidget {
  const TextGenerate({super.key});

  @override
  State<TextGenerate> createState() => _TextGenerateState();
}

class _TextGenerateState extends State<TextGenerate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(' '),
    ),
      ],
    );
  }
}

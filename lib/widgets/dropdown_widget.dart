import 'package:conversation_agent_app/constants/constants.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String currentType="Multiple Choice Questions";

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.deepPurple,
        iconEnabledColor: Colors.grey[100],
        items: getResponseType,
        value: currentType,
        onChanged: (value){
          setState(() {
            currentType=value.toString();
          });
        }
    );
  }
}

import 'package:conversation_agent_app/constants/constants.dart';
import 'package:conversation_agent_app/providers/response_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/constants.dart';
import '../providers/chat_provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String? currentType;//="Multiple Choice Questions";

  @override
  Widget build(BuildContext context) {
    final responseProvider=Provider.of<ResponseProvider>(context, listen: false);
    // final chatProvider=Provider.of<ChatProvider>(context, listen: false);

    currentType=responseProvider.getCurrentResponseType();
    return DropdownButton(
      dropdownColor: Colors.deepPurple,
        iconEnabledColor: Colors.grey[100],
        items: responseProvider.getResponseType,
        value: currentType,
        onChanged: (value){
          setState(() {
            currentType=value.toString();
          });

          responseProvider.setCurrentResponseType(value.toString());
        }
    );
  }
}

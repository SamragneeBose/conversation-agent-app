import 'package:conversation_agent_app/widgets/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class Services{
  static Future<void> showModalSheet({required BuildContext context}) async{
    await showModalBottomSheet(
        backgroundColor: Colors.deepPurple[400],
        context: context,
        builder: (context){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextWidget(
                    label: "Respone Type:",
                    fontSize: 16,
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                  child: DropDownWidget(),
              ),
            ],
          );
        });
  }
}
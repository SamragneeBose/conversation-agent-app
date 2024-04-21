import 'package:conversation_agent_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationWidget extends StatelessWidget {
  const ConversationWidget({
    super.key,
    required this.msg,
    required this.index
  });

  final String msg;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: index==0? Colors.deepPurple[50] : Colors.grey[100],
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index==0?
                  Icon(
                    Icons.account_box_outlined,
                    color: Colors.grey[600],
                  )
                : Icon(
                  Icons.android_rounded,
                  color: Colors.deepPurple[400],
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: TextWidget(
                        label: msg
                    ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

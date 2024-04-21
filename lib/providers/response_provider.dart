import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../widgets/text_widget.dart';

class ResponseProvider with ChangeNotifier{
  // List<String> responseList=[];

  String currentResponseType="Multiple Choice Questions";

  String getCurrentResponseType() {
    return currentResponseType;
  }

  void setCurrentResponseType(String newResponse) {
    currentResponseType=newResponse;
    notifyListeners();
  }

  List<DropdownMenuItem<String>>? get getResponseType{
    List<DropdownMenuItem<String>>? responseTypes =
    List<DropdownMenuItem<String>>.generate(
      responses.length,
          (index) => DropdownMenuItem(
        value: responses[index],
          child: TextWidget(
          label: responses[index],
          fontSize: 15,
          color: Colors.grey[100],
        ),
      ),
    );
    return responseTypes;
  }
}
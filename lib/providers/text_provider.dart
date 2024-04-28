import 'package:flutter/cupertino.dart';

class TextProvider with ChangeNotifier{

  String text="";

  void setExtractedText({required String msg}) {
    text=msg;
    notifyListeners();
  }

  String getExtractedText() {
    return text;
  }

  void clearExtractedText () {
    text="";

    notifyListeners();
  }

  // late TextEditingController textEditingController;
  //
  // TextEditingController getTextEditingController() {
  //   return textEditingController;
  // }
  //
  // void addTextToTextField({required String msg}) {
  //   textEditingController.text=msg;
  //   notifyListeners();
  // }
  //
  // void clearTextField() {
  //   textEditingController.clear();
  //   notifyListeners();
  // }
}
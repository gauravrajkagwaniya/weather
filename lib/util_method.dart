import 'package:flutter/material.dart';

class UtilMethod{
  static void hideKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }
  }
  static Size mediaSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
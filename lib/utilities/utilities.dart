import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool validateEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(email)) ? false : true;
}

bool validatePhoneNumber(String phoneNumber) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(phoneNumber)) ? false : true;
}

void successToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: AppColors.primaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void errorToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Color getColorByName(String colorName) {
  colorName = colorName.toLowerCase();

  Map<String, Color> colorMap = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'white': Colors.white,
    // Add more color names and codes as needed
  };

  return colorMap[colorName] ?? Colors.black;
}

Color hexColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "0xFF$hexColor";
  }
  return Color(int.parse(hexColor));
}

void showPopup({
  required BuildContext context,
  required VoidCallback firstButtonAction,
  String firstButtonText = 'Delete',
  VoidCallback? secondButtonAction,
  String secondButtonText = 'Close',
  String title = 'Warning',
  String content = 'Do you want to delete?',
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: firstButtonAction, child: Text(firstButtonText)),
        TextButton(
            onPressed: secondButtonAction, child: Text(secondButtonText)),
      ],
    ),
  );
}

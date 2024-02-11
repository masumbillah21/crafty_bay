import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Center(
        child: Text(AppMessages.emptyMessage("Notification")),
      ),
    );
  }
}

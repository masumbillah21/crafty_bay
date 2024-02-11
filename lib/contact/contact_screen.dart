import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Bangladesh'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('info@exmaple.com'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('+880 171 367 6788'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

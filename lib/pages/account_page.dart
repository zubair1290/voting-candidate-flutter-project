import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String username;
  final String email;

  const AccountPage({
    Key? key,
    required this.username,
    required this.email
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username: $username",
            style: textStyle
          ),
          const SizedBox(height: 20,),
          Text(
            "Email: $email",
            style: textStyle,
          ),
        ]
      ),
    );
  }
}
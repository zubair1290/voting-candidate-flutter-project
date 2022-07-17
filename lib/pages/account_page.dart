import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username: zubair9099",
            style: TextStyle(
              fontSize: 20,
            )
          ),
          const SizedBox(height: 20,),
          Text(
            "Email: zubair@gmail.com",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ]
      ),
    );
  }
}
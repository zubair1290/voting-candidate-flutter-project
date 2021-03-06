import 'package:flutter/material.dart';
import 'package:voting/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Nav(
        title: 'Voting Candidate',
        userId: 2,
        username: "zubair1011",
        email: "zubair1011@gmail.com"
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:voting/pages/vote_candidate_page.dart';
import 'package:voting/pages/vote_statistic_page.dart';
import 'package:voting/pages/account_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Nav extends StatefulWidget {
  final int userId;
  final String username;
  final String email;

  const Nav(
    {Key? key, 
    required this.title,
    required this.userId,
    required this.username,
    required this.email
  }) : super(key: key);

  final String title;

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currIdxBtmNavBar = 0;
  dynamic json = "";

  dynamic getCandidates() async {
    var url = Uri.parse("http://localhost:1337/api/candidates?populate=*");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        json = jsonDecode(response.body);
      });
    } 
  }
  Future<bool> voteCandidates({required dynamic user, required dynamic candidate}) async {
    var url = Uri.parse("http://localhost:1337/api/votes");
    var response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "data": {
          "user": user,
          "candidate": candidate
        }
      }),
    );
    print("response statusCode ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    } 
    return false;
  }

  @override
  void initState() {
    super.initState();
    getCandidates();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> dataVote = json != "" ? json["data"]: [];
    List<Widget> pages = [
      VoteCandidatePage(
        userId: widget.userId,
        username: widget.username,
        dataVote: dataVote,
        voteCandidatesFunc: voteCandidates
      ),
      VoteStatisticPage(
        dataVote: dataVote
      ),
      AccountPage(
        username: widget.username,
        email: widget.email
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[_currIdxBtmNavBar],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Vote Candidate',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Voting Statistic',
            backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.blue
          ),
        ],
        currentIndex: _currIdxBtmNavBar,
        onTap: (i) {
          setState(() {
            _currIdxBtmNavBar = i;
          });
        },
      ),
    );
  }
}
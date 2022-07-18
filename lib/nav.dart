import 'package:flutter/material.dart';
import 'package:voting/pages/vote_candidate_page.dart';
import 'package:voting/pages/vote_statistic_page.dart';
import 'package:voting/pages/account_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Nav extends StatefulWidget {
  const Nav({Key? key, required this.title}) : super(key: key);

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
        dataVote: dataVote
      ),
      VoteStatisticPage(
        dataVote: dataVote       
      ),
      const AccountPage(),
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
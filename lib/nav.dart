import 'package:flutter/material.dart';
import 'package:voting/Pages/vote_candidate_page.dart';
import 'package:voting/Pages/vote_statistic_page.dart';
import 'package:voting/Pages/account_page.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currIdxBtmNavBar = 0;

  List<Widget> pages = [
    const VoteCandidatePage(),
    const VoteStatisticPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
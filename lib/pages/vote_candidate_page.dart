import 'package:flutter/material.dart';
import 'package:voting/widgets/candidate_img.dart';
import 'package:voting/widgets/vote_btn.dart';

class VoteCandidatePage extends StatelessWidget {
  final int userId;
  final String username;
  final List<dynamic> dataVote;
  final Function voteCandidatesFunc;

  const VoteCandidatePage({
    Key? key,
    required this.userId,
    required this.username,
    required this.dataVote,
    required this.voteCandidatesFunc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String url = "http://localhost:1337";
    return SizedBox(
      child: (dataVote.isNotEmpty) ? ListView.builder(
        itemCount: dataVote.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CandidateImage(url: url, dataVote: dataVote, index: index),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10,),
                      Text(
                        dataVote[index]["attributes"]["head"],
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        dataVote[index]["attributes"]["vice"],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 18,),
                      VoteBtn(
                        userId: userId, 
                        dataVote: dataVote, 
                        index: index, 
                        voteCandidatesFunc: voteCandidatesFunc
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ) : const Center(child: Text("Empty Candidates")),
    );
  }
}
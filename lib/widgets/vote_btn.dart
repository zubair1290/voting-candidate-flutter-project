import 'package:flutter/material.dart';

class VoteBtn extends StatelessWidget {
  final int userId;
  final dynamic dataVote;
  final int index;
  final Function voteCandidatesFunc;
  const VoteBtn({
    Key? key,
    required this.userId,
    required this.dataVote,
    required this.index,
    required this.voteCandidatesFunc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white70), 
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          fixedSize: MaterialStateProperty.all(const Size(40, 40)),
          textStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 20,
          )),
        ),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext ctx) => AlertDialog(
              title: const Text("Vote"),
              content: Text("Do you want to vote ${
                dataVote[index]["attributes"]["head"]
              } and ${
                dataVote[index]["attributes"]["vice"]
              }"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'), 
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context, 'Ok');
                    var isVoted = await voteCandidatesFunc(
                      user: {"id": userId},
                      candidate: {"id": dataVote[index]["id"]}
                    );
                    if (isVoted) {
                      showDialog(
                        context: context, 
                        builder: (BuildContext ctx2) => AlertDialog(
                          title: const Text("Success"),
                          content: Text("Success to vote ${
                            dataVote[index]["attributes"]["head"]
                          } and ${
                            dataVote[index]["attributes"]["vice"]
                          }"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, "Ok"), 
                              child: const Text("Ok")
                            ),
                          ],
                        )
                      );
                    } else {
                      showDialog(
                        context: context, 
                        builder: (BuildContext ctx2) => AlertDialog(
                          title: const Text("Failed"),
                          content: Text("Failed to vote ${
                            dataVote[index]["attributes"]["head"]
                          } and ${
                            dataVote[index]["attributes"]["vice"]
                          }"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, "Ok"), 
                              child: const Text("Ok")
                            ),
                          ],
                        )
                      );
                    }
                  }, 
                  child: const Text("Ok"),
                ),
              ],
            )
          );
        }, 
        child: const Text("Vote"),
      ),
    );
  }
}
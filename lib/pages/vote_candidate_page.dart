import 'package:flutter/material.dart';

class VoteCandidatePage extends StatelessWidget {
  final List<dynamic> dataVote;

  const VoteCandidatePage({
    Key? key,
    required this.dataVote,
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
                  Row(
                    children: [
                      // Expanded(
                      //   child: Container(
                      //     // height: 220,
                      //     // width: 180,
                      //     decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: Theme.of(context).primaryColor,
                      //         width: 2,
                      //       ),
                      //     ),
                      //     child: Image.network(
                      //       'http://localhost:1337/uploads/small_Joko_Widodo_presidential_portrait_2016_0253d19b01.jpg', 
                      //       height: 220,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        // height: 220,
                        // width: 180,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Row(children: [
                          Image.network(
                            url + dataVote[index]["attributes"]["head_image"]["data"]["attributes"]["url"],
                            height: 220,
                          ),
                          Image.network(
                            url + dataVote[index]["attributes"]["vice_image"]["data"]["attributes"]["url"],
                            height: 220,
                          ),
                        ],) 
                      ),
                    ],
                  ),
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
                      Container(
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
                                    onPressed: () => Navigator.pop(context, 'Ok'), 
                                    child: const Text("Ok"),
                                  ),
                                ],
                              )
                            );
                          }, 
                          child: const Text("Vote"),
                        ),
                      )
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
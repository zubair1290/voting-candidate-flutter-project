import 'package:flutter/material.dart';

class VoteCandidatePage extends StatelessWidget {
  const VoteCandidatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return Card(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 220,
                          // width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text("Image Presiden"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 220,
                          // width: 180,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text("Image Wakil"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        "Nama Presiden",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Nama Wakil",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 18,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white70), 
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                            fixedSize: MaterialStateProperty.all(Size(40, 40)),
                            textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 20,
                            )),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context, 
                              builder: (BuildContext ctx) => AlertDialog(
                                title: const Text("Vote"),
                                content: const Text("Do you want to vote this president?"),
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
                          child: Text("Vote"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
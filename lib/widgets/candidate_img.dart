import 'package:flutter/material.dart';

class CandidateImage extends StatelessWidget {
  final String url;
  final dynamic dataVote;
  final int index;
  const CandidateImage({
    Key? key,
    required this.url,
    required this.dataVote,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
    );
  }
}

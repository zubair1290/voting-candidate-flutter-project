import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class VoteStatisticPage extends StatelessWidget {
  final List<dynamic> dataVote;

  const VoteStatisticPage({
    Key? key,
    required this.dataVote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartSections = [];
    if (dataVote.isNotEmpty) {
      for (int i = 0; i < dataVote.length; i++) {
        pieChartSections.add(PieChartSectionData(
          title: "Calon ${i+1}: ${dataVote[i]["attributes"]["number_of_votes"]} suara",
          value: double.parse(dataVote[i]["attributes"]["number_of_votes"]),
          color: Color.fromARGB(
            math.Random().nextInt(256), 
            math.Random().nextInt(256), 
            math.Random().nextInt(256),
            255
          ),
        ));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
        PieChartData(
          sections: pieChartSections,
          // [
          //   PieChartSectionData(
          //     title: "Calon 1: ${data} suara",
          //     value: 10,
          //     color: Colors.red,
          //   ),
          //   PieChartSectionData(
          //     title: "Calon 2: 15 suara",
          //     value: 15,
          //     color: Colors.blue,
          //   ),
          // ],
        )
      ),
    );
  }
}
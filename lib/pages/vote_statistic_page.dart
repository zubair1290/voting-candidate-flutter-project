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
          title: "Calon ${i+1}: ${dataVote[i]["attributes"]["votes"]["data"].length} suara",
          value: dataVote[i]["attributes"]["votes"]["data"].length,
          color: Color.fromARGB(
            255, 
            math.Random().nextInt(256), 
            math.Random().nextInt(256),
            math.Random().nextInt(256),
          ),
        ));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
        PieChartData(
          sections: pieChartSections,
        )
      ),
    );
  }
}
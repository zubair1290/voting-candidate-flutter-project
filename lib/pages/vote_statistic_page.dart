import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VoteStatisticPage extends StatelessWidget {
  const VoteStatisticPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              title: "Calon 1: 10 suara",
              value: 10,
              color: Colors.red,
            ),
            PieChartSectionData(
              title: "Calon 2: 15 suara",
              value: 15,
              color: Colors.blue,
            ),
          ],
        )
      ),
    );
  }
}
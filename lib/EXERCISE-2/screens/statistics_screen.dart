import 'package:flutter/material.dart';
import '/EXERCISE-2/models/color_counters.dart';
import 'package:provider/provider.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Consumer<ColorCounters>(
        builder: (context, colorCounters, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${colorCounters.redTapCount}', style: TextStyle(fontSize: 24)),
                Text('Blue Taps: ${colorCounters.blueTapCount}', style: TextStyle(fontSize: 24)),
              ],
            ),
          );
        },
      ),
    );
  }
}
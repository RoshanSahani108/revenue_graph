import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RevenueDashboard(),
    );
  }
}

class RevenueDashboard extends StatefulWidget {
  @override
  _RevenueDashboardState createState() => _RevenueDashboardState();
}

class _RevenueDashboardState extends State<RevenueDashboard> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showChart = true; // Track if the chart is visible

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Time Revenue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Toggle the chart visibility
                        setState(() {
                          _showChart = !_showChart;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white),
                      ),
                      child: Text(_showChart ? "hide details" : "show details"),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Revenue Text
                Text(
                  "\$210,255,20",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Average \$20 per order",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),

                // Chart Animation with Bottom Slide Effect
                AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: _showChart
                      ? Column(
                    children: [
                      // TabBar
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: "Today"),
                          Tab(text: "Week"),
                          Tab(text: "Month"),
                        ],
                        indicatorColor: Colors.blue,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                      ),
                      // Chart Area
                      SizedBox(
                        height: 200, // Chart height
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildChart(),
                            _buildChart1(),
                            _buildChart2(),
                          ],
                        ),
                      ),
                    ],
                  )
                      : SizedBox.shrink(), // Empty when hidden
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Updated for new version
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Updated for new version
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 0),
              FlSpot(1, 1.5),
              FlSpot(2, 0.8),
              FlSpot(3, 2.0),
              FlSpot(4, 1.2),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

Widget _buildChart1() {
  return LineChart(
    LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Updated for new version
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Updated for new version
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(1, 1.0),
            FlSpot(2, 0.4),
            FlSpot(3, 1.0),
            FlSpot(4, 2.2),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
        ),
      ],
    ),
  );
}

Widget _buildChart2() {
  return LineChart(
    LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Updated for new version
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false), // Updated for new version
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 0),
            FlSpot(1, 1.5),
            FlSpot(2, 0.8),
            FlSpot(3, 2.0),
            FlSpot(4, 2.2),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 2,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
        ),
      ],
    ),
  );
}


import 'package:flutter/material.dart';
import 'local_happenings_page.dart';
import 'day_tours_page.dart';
import 'multi_day_travels_page.dart';
import 'regions_page.dart';

class CountryTabs extends StatefulWidget {
  const CountryTabs({super.key});

  @override
  _CountryTabsState createState() => _CountryTabsState();
}

class _CountryTabsState extends State<CountryTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Local Happenings'),
              Tab(text: 'Day Tours'),
              Tab(text: 'Multi-Day Travels'),
              Tab(text: 'Exploring Regions'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LocalHappeningsPage(), // Replace with your actual page widgets
                DayToursPage(),
                MultiDayTravelsPage(),
                RegionsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:newdestinations/countryScreen/CityExplorations.dart';
import 'package:newdestinations/countryScreen/ConcertFestivals.dart';
import 'package:newdestinations/countryScreen/CulturalAdventures.dart';
import 'package:newdestinations/countryScreen/DayTrips.dart';
import 'package:newdestinations/countryScreen/DiscoveryDen.dart';
import 'package:newdestinations/countryScreen/FarmandAgritourismTours.dart';
import 'package:newdestinations/countryScreen/FoodandDrinkAdventures.dart';
import 'package:newdestinations/countryScreen/NatureAndWildlifeExpeditions.dart';
import 'package:newdestinations/countryScreen/PageToScreenTours.dart';
import 'package:newdestinations/countryScreen/RegionExplorations.dart';
import 'package:newdestinations/countryScreen/TracktoSailVoyages.dart';
import 'package:newdestinations/countryScreen/EcoExploration.dart';
import 'package:newdestinations/countryScreen/NightlifeDiscoveries.dart';
import 'package:newdestinations/countryScreen/SpaRetreats.dart';
import 'package:newdestinations/countryScreen/ShoppingExperiences.dart';
import 'package:newdestinations/countryScreen/WalkingAdventures.dart';
import 'package:newdestinations/countryScreen/HistoryandFiguresTours.dart';
import 'package:newdestinations/countryScreen/UniqueHotels.dart';
import 'package:newdestinations/countryScreen/AdventureEscapes.dart';
import 'package:newdestinations/countryScreen/MultiDayTours.dart';

class CountryTabWidget extends StatelessWidget {
  final List<Map<String, dynamic>> tabData = [
    {"id": 1, "tab_name": "Day Tours", "tab_page": "DayTours.dart"},
    {"id": 2, "tab_name": "Multi Day Tours", "tab_page": "MultiDayTours.dart"},
    {
      "id": 3,
      "tab_name": "Concerts & Festivals",
      "tab_page": "ConcertsFestivals.dart"
    },
    {
      "id": 4,
      "tab_name": "City Explorations",
      "tab_page": "CityExplorations.dart"
    },
    {
      "id": 5,
      "tab_name": "Region Explorations",
      "tab_page": "RegionExplorations.dart"
    },
    {
      "id": 6,
      "tab_name": "Page-to-Screen Tours",
      "tab_page": "PageToScreenTours.dart"
    },
    {"id": 7, "tab_name": "Discovery Den", "tab_page": "DiscoveryDen.dart"},
    {
      "id": 8,
      "tab_name": "Cultural Adventures",
      "tab_page": "CulturalAdventures.dart"
    },
    {
      "id": 9,
      "tab_name": "Food & Drink Adventures",
      "tab_page": "FoodAndDrinkAdventures.dart"
    },
    {
      "id": 10,
      "tab_name": "Adventure Escapes",
      "tab_page": "AdventureEscapes.dart"
    },
    {"id": 11, "tab_name": "Unique Hotels", "tab_page": "UniqueHotels.dart"},
    {
      "id": 12,
      "tab_name": "Nature & Wildlife Expeditions",
      "tab_page": "NatureAndWildlifeExpeditions.dart"
    },
    {
      "id": 13,
      "tab_name": "History & Figures Tours",
      "tab_page": "HistoryAndFiguresTours.dart"
    },
    {
      "id": 14,
      "tab_name": "Walking Adventures",
      "tab_page": "WalkingAdventures.dart"
    },
    {
      "id": 15,
      "tab_name": "Shopping Experiences",
      "tab_page": "ShoppingExperiences.dart"
    },
    {"id": 16, "tab_name": "Spa Retreats", "tab_page": "SpaRetreats.dart"},
    {
      "id": 17,
      "tab_name": "Nightlife Discoveries",
      "tab_page": "NightlifeDiscoveries.dart"
    },
    {
      "id": 18,
      "tab_name": "Eco-Explorations",
      "tab_page": "EcoExplorations.dart"
    },
    {
      "id": 19,
      "tab_name": "Farm and Agritourism Tours",
      "tab_page": "FarmandAgritourismTours.dart"
    },
    {
      "id": 20,
      "tab_name": "Track to Sail Voyages",
      "tab_page": "TracktoSailVoyages.dart"
    },
  ];

  CountryTabWidget({super.key});

  @override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: tabData.length,
    child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            isScrollable: true,
            tabs: tabData.map((tab) => Tab(text: tab['tab_name'])).toList(),
          ),
          // Wrap TabBarView with a Container and set its height limit
          Container(
            constraints: const BoxConstraints(maxHeight: 800),
            child: TabBarView(
              children: tabData.map((tab) {
                return _loadTabPage(tab['tab_page']);
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget _loadTabPage(String tabPage) {
    switch (tabPage) {
      case 'DayTours.dart':
        return const DayTrips();
      case 'MultiDayTours.dart':
        return const MultiDayTours();
      case 'ConcertsFestivals.dart':
        return const ConcertsFestivals();
      case 'CityExplorations.dart':
        return const CityExplorations();
      case 'RegionExplorations.dart':
        return const RegionExplorations();
      case 'PageToScreenTours.dart':
        return const PageToScreenTours();
      case 'DiscoveryDen.dart':
        return const DiscoveryDen();
      case 'CulturalAdventures.dart':
        return const CulturalAdventures();
      case 'FoodAndDrinkAdventures.dart':
        return const FoodAndDrinkAdventures();
      case 'AdventureEscapes.dart':
        return const AdventureEscapes();
      case 'UniqueHotels.dart':
        return const UniqueHotels();
      case 'NatureAndWildlifeExpeditions.dart':
        return const NatureAndWildlifeExpeditions();
      case 'HistoryAndFiguresTours.dart':
        return const HistoryAndFiguresTours();
      case 'WalkingAdventures.dart':
        return const WalkingAdventures();
      case 'ShoppingExperiences.dart':
        return const ShoppingExperiences();
      case 'SpaRetreats.dart':
        return const SpaRetreats();
      case 'NightlifeDiscoveries.dart':
        return const NightlifeDiscoveries();
      case 'EcoExplorations.dart':
        return const EcoExplorations();
      case 'FarmandAgritourismTours.dart':
        return const FarmandAgritourismTours();
      case 'TracktoSailVoyages.dart':
        return const TracktoSailVoyages();
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}

// Make sure you have the corresponding page classes defined in your project
// For example, DayTours.dart should have a DayTours widget defined in it
// Similarly, for other pages

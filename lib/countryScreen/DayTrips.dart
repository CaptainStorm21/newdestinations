import 'package:flutter/material.dart';

class City {
  final String name;
  final String description;
  final String imageUrl;

  const City(this.name, this.description, this.imageUrl);
}

class DayTrips extends StatelessWidget {
  const DayTrips({super.key});

  final List<City> cities = const [
    City(
        "Edinburgh",
        "Edinburgh is Scotland's compact, hilly capital. It has a medieval Old Town and elegant Georgian New Town.",
        "https://via.placeholder.com/150"),
    City(
        "Glasgow",
        "Glasgow is a port city on the River Clyde in Scotland's western Lowlands. It's famed for its Victorian and art nouveau architecture.",
        "https://via.placeholder.com/150"),
    City(
        "Aberdeen",
        "Aberdeen is a port city in northeast Scotland, where the Dee and Don rivers meet the North Sea.",
        "https://via.placeholder.com/150"),
    City(
        "Dundee",
        "Dundee is Scotland's fourth-largest city and is known for its vibrant arts scene and waterfront regeneration.",
        "https://via.placeholder.com/150"),
    City(
        "Stirling",
        "Stirling is a city in central Scotland. It's clustered around a large fortress and medieval old town.",
        "https://via.placeholder.com/150"),
    City(
        "Inverness",
        "Inverness is a city on Scotland’s northeast coast, where the River Ness meets the Moray Firth.",
        "https://via.placeholder.com/150"),
    City(
        "Perth",
        "Perth is a city on the banks of the River Tay in central Scotland. It's known for its picturesque setting.",
        "https://via.placeholder.com/150"),
    City(
        "Falkirk",
        "Falkirk is a town in the Central Lowlands of Scotland. It lies in the Forth Valley, almost midway between Glasgow and Edinburgh.",
        "https://via.placeholder.com/150"),
    City(
        "Paisley",
        "Paisley is a town situated in the west central Lowlands of Scotland. It is the largest town in the historic county of Renfrewshire.",
        "https://via.placeholder.com/150"),
    City(
        "Ayr",
        "Ayr is a coastal town on the west coast of Ayrshire, Scotland. It's known for its sandy beach and sea views.",
        "https://via.placeholder.com/150"),
    City(
        "Dumfries",
        "Dumfries is a market town and former royal burgh within the Dumfries and Galloway council area of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Kilmarnock",
        "Kilmarnock is a large burgh in East Ayrshire, Scotland. It's known for its history in the weaving and textile industry.",
        "https://via.placeholder.com/150"),
    City(
        "Motherwell",
        "Motherwell is a large town and former burgh in North Lanarkshire, Scotland, south-east of Glasgow.",
        "https://via.placeholder.com/150"),
    City(
        "Greenock",
        "Greenock is a town and administrative centre in the Inverclyde council area in Scotland and a former burgh within the historic county of Renfrewshire.",
        "https://via.placeholder.com/150"),
    City(
        "Hamilton",
        "Hamilton is a town in South Lanarkshire, in the central Lowlands of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Kirkcaldy",
        "Kirkcaldy is a town and former royal burgh in Fife, on the east coast of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Arbroath",
        "Arbroath is a former royal burgh and the largest town in the council area of Angus in Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Elgin",
        "Elgin is a town and formerly a Royal Burgh in Moray, Scotland. It is situated near the River Lossie.",
        "https://via.placeholder.com/150"),
    City(
        "Livingston",
        "Livingston is the largest town in West Lothian, Scotland. It is the second-largest settlement in the Lothians after Edinburgh.",
        "https://via.placeholder.com/150"),
    City(
        "Dunfermline",
        "Dunfermline is a town in Fife, Scotland. It was a former capital of Scotland and is located on high ground 3 miles from the northern shore of the Firth of Forth.",
        "https://via.placeholder.com/150"),
    City(
        "St Andrews",
        "St Andrews is a town on the east coast of Fife in Scotland, known worldwide as the home of golf.",
        "https://via.placeholder.com/150"),
    City(
        "Oban",
        "Oban is a resort town within the Argyll and Bute council area of Scotland. It is also known as the Gateway to the Isles.",
        "https://via.placeholder.com/150"),
    City(
        "Fort William",
        "Fort William is a town in the western Scottish Highlands, on the shores of Loch Linnhe.",
        "https://via.placeholder.com/150"),
    City(
        "Nairn",
        "Nairn is a town and former burgh in the Highland council area of Scotland. It is an ancient fishing port and market town around 16 miles east of Inverness.",
        "https://via.placeholder.com/150"),
    City(
        "Troon",
        "Troon is a town in South Ayrshire, Scotland. It is situated on the west coast, about 8 miles north of Ayr.",
        "https://via.placeholder.com/150"),
    City(
        "Dunblane",
        "Dunblane is a small town in the council area of Stirling, Scotland. It is located on the Allan Water, a tributary of the River Forth.",
        "https://via.placeholder.com/150"),
    City(
        "Melrose",
        "Melrose is a town and former royal burgh in the Scottish Borders, historically in Roxburghshire.",
        "https://via.placeholder.com/150"),
    City(
        "Cupar",
        "Cupar is a town and former royal burgh in Fife, Scotland. The town is situated on the banks of the River Eden.",
        "https://via.placeholder.com/150"),
    City(
        "Linlithgow",
        "Linlithgow is a royal burgh in West Lothian, Scotland. It is situated in the central Lowlands on the south shore of Linlithgow Loch.",
        "https://via.placeholder.com/150"),
    City(
        "Helensburgh",
        "Helensburgh is a town within the Helensburgh and Lomond area of Argyll and Bute council area of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Pitlochry",
        "Pitlochry is a burgh in the county of Perthshire in Scotland, lying on the River Tummel.",
        "https://via.placeholder.com/150"),
    City(
        "Crieff",
        "Crieff is a market town in Perth and Kinross, Scotland. It is located on the A85 road between Perth and Crianlarich.",
        "https://via.placeholder.com/150"),
    City(
        "Forfar",
        "Forfar is a town and the administrative centre of Angus in Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Hawick",
        "Hawick is a town in the Scottish Borders council area and historic county of Roxburghshire in the east Southern Uplands of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Campbeltown",
        "Campbeltown is a town and former royal burgh in Argyll and Bute, Scotland. It lies by Campbeltown Loch on the Kintyre peninsula.",
        "https://via.placeholder.com/150"),
    City(
        "Thurso",
        "Thurso is a town and former burgh on the north coast of the Highland council area of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Ullapool",
        "Ullapool is a port and town in the Scottish Highlands. Despite its modest size, it is the largest settlement for many miles around.",
        "https://via.placeholder.com/150"),
    City(
        "Stonehaven",
        "Stonehaven is a town in Aberdeenshire, Scotland. It lies on Scotland's northeast coast.",
        "https://via.placeholder.com/150"),
    City(
        "Anstruther",
        "Anstruther is a small town in Fife, Scotland, situated on the north shore of the Firth of Forth.",
        "https://via.placeholder.com/150"),
    City(
        "Dornoch",
        "Dornoch is a town and seaside resort in the Highlands of Scotland.",
        "https://via.placeholder.com/150"),
    City(
        "Lerwick",
        "Lerwick is the main port of the Shetland Islands, Scotland, and the northernmost town in the United Kingdom.",
        "https://via.placeholder.com/150"),
    City(
        "Largs",
        "Largs is a town on the Firth of Clyde in North Ayrshire, Scotland, about 33 miles from Glasgow.",
        "https://via.placeholder.com/150"),
    City(
        "Ballater",
        "Ballater is a village in Aberdeenshire, Scotland on the River Dee.",
        "https://via.placeholder.com/150"),
    City(
        "Fraserburgh",
        "Fraserburgh is a town in Aberdeenshire, Scotland with a busy harbour and large fish processing industry.",
        "https://via.placeholder.com/150"),
    City(
        "Golspie",
        "Golspie is a village in Sutherland, Highland, Scotland. It lies on the North Sea coast in the shadow of Ben Bhraggie.",
        "https://via.placeholder.com/150"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          final city = cities[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(city.imageUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    city.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(city.description),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

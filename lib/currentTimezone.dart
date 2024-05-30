// import 'currentTimezone.dart';
// import 'package:flutter/material.dart';
// import 'package:timezone/timezone.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:newdestinations/currentTimezone.dart';



// class TimeZoneModel {
//   late final String timeZoneName;
//   late final String timeZoneAbbr;
//   late final int timeZoneOffset;

//   TimeZoneModel() {
//     tz.initializeTimeZones();
//     updateTimeZone();
//   }

//   String getTimeZoneAbbreviation(TimeZone timeZone) {
//     final int offsetHours = timeZone.offset ~/ Duration.hoursPerHour;
//     final Map<int, String> timeZoneAbbreviations = {
//       -12: 'IDLW',
//       -11: 'NT',
//       -10: 'HST',
//       -9: 'AKST',
//       -8: 'PST',
//       -7: 'MST',
//       -6: 'CST',
//       -5: 'EST',
//       -4: 'AST',
//       -3: 'ADT',
//       -2: 'HAT',
//       -1: 'AZOST',
//       0: 'GMT',
//       1: 'CET',
//       2: 'EET',
//       3: 'MSK',
//       4: 'SAMT',
//       5: 'PKT',
//       6: 'BST',
//       7: 'THA',
//       8: 'CST',
//       9: 'JST',
//       10: 'AEST',
//       11: 'AEDT',
//       12: 'NZST',
//     };
//     return timeZoneAbbreviations[offsetHours] ?? '';
//   }

//   void updateTimeZone() {
//     final location = getLocation(tz.local.name);
//     final timeZone = location.timeZone(DateTime.now());
//     timeZoneName = location.name;
//     timeZoneAbbr = getTimeZoneAbbreviation(timeZone);
//     timeZoneOffset = timeZone.offset.inHours;
//   }
// }

// mixin hoursPerHour {
// }

// class TimeZoneWidget extends StatefulWidget {
//   const TimeZoneWidget({super.key});

//   @override
//   _TimeZoneWidgetState createState() => _TimeZoneWidgetState();
// }

// class _TimeZoneWidgetState extends State<TimeZoneWidget> {
//   late final TimeZoneModel model;

//   @override
//   void initState() {
//     super.initState();
//     model = TimeZoneModel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Timezone: ${model.timeZoneName}',
//           style: const TextStyle(fontSize: 18.0),
//         ),
//         Text(
//           'Abbreviation: ${model.timeZoneAbbr}',
//           style: const TextStyle(fontSize: 18.0),
//         ),
//         Text(
//           'Offset: UTC ${model.timeZoneOffset >= 0 ? '+' : '-'}${model.timeZoneOffset.abs()} hours',
//           style: const TextStyle(fontSize: 18.0),
//         ),
//       ],
//     );
//   }
// }


// class CurrentTimezone extends StatelessWidget {
//   const CurrentTimezone({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Current Timezone',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
      
//         body: StreamBuilder<TimeZoneModel>(
//           stream: Stream.periodic(const Duration(seconds: 1), (i) => TimeZoneModel()),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return const TimeZoneWidget();
//           },
//         ),
//       ),
//     );
//   }
// }
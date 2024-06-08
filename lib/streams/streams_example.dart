import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();

    // _streamController.stream.listen(
    //   (event) {
    //     log("Event :$event");
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Demo"),
      ),
      body: StreamBuilder(
        // stream: _streamController.stream,
        stream: buildStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Text(snapshot.data.toString()),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.sink.add(100);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

Stream<String> buildStream() async* {
  yield "String 1";
  await Future.delayed(const Duration(seconds: 2));

  yield "String 2";
  await Future.delayed(const Duration(seconds: 1));

  yield "String 3";
}

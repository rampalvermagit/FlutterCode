import 'package:flutter/material.dart';

class RXDartTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Block using RX Dart'),
      ),
      body:Container(
         margin: EdgeInsets.all(10.0),
       alignment: Alignment.center,
       child: Text('Block using RXDart ReplaySubject'),
      ),
    );
  }

}
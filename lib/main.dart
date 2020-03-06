import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        opaque: true,
        builder: (context) => Positioned(
              top: 24,
              right: 320,
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Text('1', style: TextStyle(color: Colors.white))),
            ));

    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 2));
    overlayEntry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay Widget Example'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 13, 0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {
              showOverlay(context);
            },
            child: Text(
              'Show the Icon',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.black),
      ),
    );
  }
}

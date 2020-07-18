import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
     
      body: Hero(
          tag: 'flutterLogo',
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 2),
                      pageBuilder: (_, __, ___) => HeroExamplePage())),
              child: FlutterLogo(
            size: 100.0,
          ))),
    );
  }
}

class HeroExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected image'),
      ),
      body: Center(
        child: Hero(
            tag: 'flutterLogo',
            child: FlutterLogo(
              size: 200.0,
            )
        ),
      ),
    );
  }
}
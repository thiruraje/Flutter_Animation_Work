import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

    AnimationController _animationController;
    double animationDuration = 0.0;
    int totalItems = 10;

      @override
      void initState() {
          super.initState();
          final int totalDuration = 6000;
        _animationController = AnimationController(
            vsync: this, 
            duration: new Duration(milliseconds: totalDuration));
            animationDuration = totalDuration/(100*(totalDuration/totalItems));
         _animationController.forward();
      }

      FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;

      @override
      void dispose() {
        _animationController.dispose();
        super.dispose();
      }

      @override
      Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
              title: new Text("hello"),
            ),
            // ListView Builder
            body:  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Headline',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: totalItems,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return new Item(index: index, animationController: _animationController, duration: animationDuration,child:Text("thiru"));
              },
            ),
          ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: totalItems,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return  Item(index: index, animationController: _animationController, duration: animationDuration,child:Text("thiru"));
              },
            ),
          ),
        ],
      ),
);
      }
}

class Item extends StatefulWidget {
  
    final int index;
    final AnimationController animationController;
    final double duration;
    final Widget child;

    Item({this.index, this.animationController, this.duration,this.child});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Animation _animation;
      double start;
      double end;

      @override
      void initState() {
        super.initState();
        start = (widget.duration * widget.index ).toDouble();
        end = start + widget.duration;
        print("START $start , end $end");
        _animation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              start,
              end,
              curve: Curves.easeIn,
            ),
          ),
        )..addListener((){
          setState(() {
                });
        });
      }
      
     @override
      Widget build(BuildContext context) {
        return Opacity(
          opacity: _animation.value,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.child,
          ),
        );
      }
}

  
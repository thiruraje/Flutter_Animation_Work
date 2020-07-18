import 'package:animation/AreaofFocus/AreaofFocusDetail.dart';
import 'package:animation/Model/AreaofFocusData.dart';
import 'package:animation/example.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';

class AreaofFocusList extends StatefulWidget {
   const AreaofFocusList(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation mainScreenAnimation;

  @override
  _AreaofFocusListState createState() => _AreaofFocusListState();
}

class _AreaofFocusListState extends State<AreaofFocusList> with TickerProviderStateMixin {
AnimationController animationController;
List<AreaofFocusData> areaoffocusData = AreaofFocusData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: areaoffocusData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =areaoffocusData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return AreaofFocusView(
                    index:index,
                    areaoffocusData: areaoffocusData[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaofFocusView extends StatelessWidget {
  const AreaofFocusView(
      {Key key, this.areaoffocusData, this.animationController, this.animation,this.index})
      : super(key: key);

  final AreaofFocusData areaoffocusData;
  final AnimationController animationController;
  final Animation<dynamic> animation;
  final index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: areaoffocusData.title.toString(), 
    child: AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: SizedBox(
              width: 130,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 8, right: 8, bottom: 16),
                    child: Column(
                      children:<Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color(0xFF3A5160).withOpacity(0.4),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                          ),
                          child:Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                  splashColor: Color(0xFF2633C5).withOpacity(0.2),
                                  onTap: () {
                                    Navigator.push(context,
                                      PageRouteBuilder(
                                          transitionDuration: Duration(seconds: 1),
                                          pageBuilder: (_, __, ___) => AreaofFocusDetail(areaoffocusData:areaoffocusData)));
                                    print(areaoffocusData.title.toString());
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.all(10),
                                        child: Image.asset('assets/images/runner.png'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                        Expanded(
                          child:  Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 16),
                          child: Text(
                                  areaoffocusData.title.toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    letterSpacing: 0.5,
                                    color: Color(0xFF4A6572),
                                  ),
                                )
                          ))
                       
                      ]
                    )
                  ),
                   
                ],
              ),
            ),
          ),
        );
      },
    ));
   
  }
}

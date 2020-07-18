import 'package:animation/Model/TeamMemberListData.dart';
import 'package:animation/Team/TeamMemberDetail.dart';
import 'package:animation/main.dart';
import 'package:flutter/material.dart';

class TeamMember extends StatefulWidget {
  
  const TeamMember(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController mainScreenAnimationController;
  final Animation<dynamic> mainScreenAnimation;

  @override
  _TeamMemberState createState() => _TeamMemberState();
}

class _TeamMemberState extends State<TeamMember> with TickerProviderStateMixin  {
  
   AnimationController animationController;
  List<TeamMemberListData> teamListData = TeamMemberListData.tabIconsList;

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
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 16),
                itemCount: teamListData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =teamListData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController.forward();

                  return TeamView(
                    teamListData: teamListData[index],
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

class TeamView extends StatelessWidget {
  const TeamView(
      {Key key, this.teamListData, this.animationController, this.animation})
      : super(key: key);

  final TeamMemberListData teamListData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: teamListData.membername.toString(),
      child:AnimatedBuilder(
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
                        top: 20, left: 8, right: 8),
                    child: Container(
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
                                          transitionDuration: Duration(seconds: 2),
                                          pageBuilder: (_, __, ___) => TeamMemberDetail(teamListData:teamListData)));
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => TeamMemberDetail()),
                                    // );
                                    // print(areaoffocusData.title.toString());
                                  },
                                  child:Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        // color: Colors.blue,
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                end: Alignment.bottomLeft,
                                                begin: Alignment.topRight,
                                                colors: [Colors.blueAccent, Color(0xFF03a7a9)]
                                            ),
                                            borderRadius: BorderRadius.circular(50)),
                                      ),
                                      CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5), radius: 48,),
                                      Padding(padding: EdgeInsets.all(10),
                                      child:CircleAvatar(backgroundImage: AssetImage(teamListData.imagePath), radius: 45,))
                                      
                                      
                                    ],
                                  ),
                          
                                ),
                              ),
                        ),
                  ),
                   
                ],
              ),
            ),
          ),
        );
      },
    )

    );
  }
}

import 'package:animation/Model/TeamMemberListData.dart';
import 'package:flutter/material.dart';

class TeamMemberDetail extends StatefulWidget {
  final TeamMemberListData teamListData;
  TeamMemberDetail({this.teamListData, key}) : super(key: key);

  @override
  _TeamMemberDetailState createState() => _TeamMemberDetailState();
}

class _TeamMemberDetailState extends State<TeamMemberDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color(0xFF2650C5),
	                          Color(0xFF2660C5),
	                        ]
	                      )
	                    ),
       child:Scaffold(
         body: Hero(
            tag: widget.teamListData.membername.toString(),
            child: SafeArea(
            child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .60,
                    child: Center(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 95.0,
                            backgroundColor: Colors.grey[300],
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                widget.teamListData.imagePath,
                              ),
                              radius: 90.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                widget.teamListData.membername.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),),
                            Expanded(
                              child: Center(
                                child: Text(
                                  widget.teamListData.role.join(' '),
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w200,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Bio",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.teamListData.detail.toString(),
                            style: TextStyle(
                              fontSize: 15.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),)
                    ),
                  
                ]
              )
              
            ],
          ),
        ))
        ),
       )
    );
  }
}
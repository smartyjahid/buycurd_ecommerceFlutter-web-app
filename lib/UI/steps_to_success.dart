import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';
import 'package:it_nobel/Webcomponent/clip_design.dart';
import 'package:it_nobel/Webcomponent/my_text_designs.dart';
import 'package:google_fonts/google_fonts.dart';

/// this page will show the caraousel view of different website design category
class StepsToSuccess extends StatelessWidget{

  Widget _myStepsSuccess(String str,String strSub,Color myColor){

    final double myCntwidth= decideMyLayoutDouble(<double>[264,138,250]);
    final double myCntHeight= decideMyLayoutDouble(<double>[300,410,60]);


    return Card(
      shadowColor: Colors.white,
      elevation: 10,
      child: Stack(
        children:<Widget>[
          ClipPath(
            clipper: MyLeafClipper(),
            child: Container(
              width: myCntwidth,
              height: myCntHeight,
              color: myColor,

            ),
          ),
          SizedBox(
            width: myCntwidth,
            height: myCntHeight,
            child: (myDeviceWidth<screenForMobile)?
            Center(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(str,style:
                    GoogleFonts.play(fontStyle: FontStyle.normal,
                        fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
            ):
            Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(str,style:
                    GoogleFonts.play(fontStyle: FontStyle.normal,
                        fontSize: 20,fontWeight: FontWeight.bold),),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 20,0),
                child: const Divider(
                  height: 2,
                  color: Colors.black38,
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(strSub,style:
                GoogleFonts.lobsterTwo(
                    fontStyle: FontStyle.normal,
                    fontSize: 18),),
              )
            ],
        ),
          )]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 90,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: animeLiquidText(turnDreamsReality)
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: myMainTitleSub(turnDreamsRealitySub)
          ),
           SizedBox(
            height: decideMyLayoutDouble(<double>[60,30,60]),
          ),
          if (isNotDesktopView) Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _myStepsSuccess(selectDesign,
                  selectDesignSub,Colors.deepOrange),
              _myStepsSuccess(addFeature,
                  addFeatureSub,Colors.yellow),
              _myStepsSuccess(discussContent,
                  discussContentSub,Colors.lightGreen),

            ],
          ) else Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _myStepsSuccess(selectDesign,
                  selectDesignSub,Colors.deepOrange),
              _myStepsSuccess(addFeature,
                  addFeatureSub,Colors.yellow),
              _myStepsSuccess(discussContent,
                  discussContentSub,Colors.lightGreen),

            ],
          )

        ],
      ),
    );
  }

}
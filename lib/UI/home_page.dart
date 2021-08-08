import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/animated_flip_box.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';
import 'package:it_nobel/Webcomponent/clip_design.dart';
import 'package:it_nobel/Webcomponent/home_page_content.dart';
import 'package:google_fonts/google_fonts.dart';

/// this page will show the  first section of scrollable website
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

/// state class of upper class
class HomePageState extends State<HomePage> {
  Widget _myBusinessAdvantage(String str, List<String> strArr, Color? myColor) {
    final double myBannerWidth = 1058 - myDeviceWidth;
    if (isNotDesktopView) {
      return Card(
        elevation: 10,
        shadowColor: Colors.white,
        child: ClipPath(
          clipper: CustomHalfCircleClipper(),
          child: Container(
            width: 250,
            color: myColor,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  str,
                  style: GoogleFonts.play(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Divider(
                    height: 2,
                    color: Colors.black38,
                    thickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Card(
        elevation: 10,
        shadowColor: Colors.white,
        child: ClipPath(
          clipper: CustomHalfCircleClipper(),
          child: Container(
            width: myBannerWidth < 0 ? 250 : 250 - (myBannerWidth / 3),
            color: myColor,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Text(
                  str,
                  style: GoogleFonts.play(
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: const Divider(
                    height: 2,
                    color: Colors.black38,
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                for (String i in strArr)
                  ListTile(
                    title: Transform.translate(
                      offset: const Offset(-25, 0),
                      child: Text(
                        i,
                        style: GoogleFonts.lobsterTwo(
                            fontStyle: FontStyle.normal, fontSize: 18),
                      ),
                    ),
                    leading: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> myBannerList = <Widget>[
      _myBusinessAdvantage(credibility,
          <String>[credibilitySub1, credibilitySub2], Colors.green[300]),
      _myBusinessAdvantage(
          brand, <String>[brandSub1, brandSub2], Colors.purple[300]),
      _myBusinessAdvantage(
          leads, <String>[leadsSub1, leadsSub2], Colors.orange[300]),
      _myBusinessAdvantage(betterService,
          <String>[betterServiceSub1, betterServiceSub2], Colors.blue[300]),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          height: decideMyLayoutDouble(<double>[400, 300, 260]),
          child: Row(
            children: <Widget>[
              Expanded(child: Center(child: HomePageContent())),
              SizedBox(
                width: decideMyLayoutDouble(<double>[400, 200, 150]),
                child: Center(
                    child: decideMyLayoutWidget(<Widget>[
                  const AnimationObject(
                      // ignore: lines_longer_than_80_chars
                      iconSize: 50.00,
                      sizeHeightMain: 250.00,
                      frontFace: Icons.face,
                      textInput: "Login",
                      textSize: 10.00),
                  const AnimationObject(
                      iconSize: 50.00,
                      sizeHeightMain: 180.00,
                      frontFace: Icons.face,
                      textInput: "Login",
                      textSize: 10.00),
                  const AnimationObject(
                      iconSize: 50.00,
                      sizeHeightMain: 140.00,
                      frontFace: Icons.face,
                      textInput: "Login",
                      textSize: 10.00)
                ])), //Image.asset('assets/images/businessmeeting.jpg'))
              ),
            ],
          ),
        ),
        SizedBox(
            height: 300,
            child: decideMyLayoutWidget([
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[...myBannerList]),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 70,
                //runSpacing: 50,

                children: <Widget>[...myBannerList],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[...myBannerList],
              )
            ])),
      ],
    );
  }
}

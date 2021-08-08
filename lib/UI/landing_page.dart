import 'dart:html';

import "package:flutter/material.dart";
import "package:it_nobel/UI/add_feature_page.dart";
import "package:it_nobel/UI/home_page.dart";
import "package:it_nobel/UI/my_design_library.dart";
import "package:it_nobel/UI/steps_to_success.dart";
import "package:it_nobel/UI/my_data_discuss.dart";
import "package:google_fonts/google_fonts.dart";
import "package:it_nobel/Util/common_method.dart";
import 'package:it_nobel/Util/global_variable.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

/// this page is the landing page  and controller of all page
class LandingPageState extends State<LandingPage> {
  ScrollController? _controller;
  final double _height = 800.0;
  double? _scrollPosition;
  String? _myCurrentPage;
  Widget _myMenuBtn(String str, Function myFunc) {
    return TextButton(
      onPressed: () {
        myFunc();
      },
      child: Text(
        //play for main title, dancing script for remaining
        str,
        style: GoogleFonts.dancingScript(
            textStyle: const TextStyle(fontSize: 30, color: myMainTextColor)),
      ),
    );
  }

  double? _scrollListener() {
    setState(() {
      _scrollPosition = _controller!.position.pixels;
    });
    final double myCurrentIndex = _scrollPosition! / _height;
    if (myCurrentIndex == 0) {
      setState(() {
        _myCurrentPage = "Get Started";
      });
    } else if (myCurrentIndex == 1) {
      setState(() {
        _myCurrentPage = "Templates";
      });
    } else if (myCurrentIndex == 2) {
      setState(() {
        _myCurrentPage = "Features";
      });
    } else if (myCurrentIndex == 3) {
      setState(() {
        _myCurrentPage = "Data Discuss";
      });
    } else {
      setState(() {
        _myCurrentPage = "The End";
      });
    }
    debugPrint("_scrollPosition $_scrollPosition  & $myCurrentIndex");
    return _scrollPosition;
  }

  @override
  void initState() {
    _controller = ScrollController();
    _myCurrentPage = "Get Started";
    _controller!.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      printDebug("constraint=${constraints.maxWidth}");
      isNotDesktopView = constraints.maxWidth < screenForLaptop;
      myDeviceWidth = constraints.maxWidth;
      return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final double childNo = (_controller!.offset / _height).abs();
            printDebug(childNo.toString());
            final double i = childNo + 1;
            _controller!.animateTo(_height * i,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn);
          },
          icon: const Icon(Icons.arrow_downward),
          label: Text(_myCurrentPage!),
          backgroundColor: Colors.red,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/myNatureImage.jpg'),
                fit: BoxFit.cover),
            /* gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.deepPurple,Colors.black]
              ),*/
          ),
          child: Stack(
            children: <Widget>[
              ListView(
                controller: _controller,
                children: <Widget>[
                  SizedBox(height: _height, child: HomePage()),
                  SizedBox(
                    height: _height,
                    // color: Colors.blueGrey,
                    child: StepsToSuccess(),
                  ),
                  SizedBox(
                    height: _height,
                    child: MyDesignLibrary(),
                  ),
                  SizedBox(
                    height: _height,
                    child: AddFeaturePage(),
                  ),
                  SizedBox(
                    height: _height,
                    child: MyDataDiscuss(),
                  ),
                ],
              ),
              if (myDeviceWidth > 800)
                Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: myCardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _myMenuBtn("Home", () {
                          _animateToIndex(0);
                        }),
                        const SizedBox(
                          width: 40,
                        ),
                        _myMenuBtn("Get Started", () {
                          _animateToIndex(1);
                        }),
                        const SizedBox(
                          width: 40,
                        ),
                        _myMenuBtn("Templates", () {
                          _animateToIndex(2);
                        }),
                        const SizedBox(
                          width: 40,
                        ),
                        _myMenuBtn("Features", () {
                          _animateToIndex(3);
                        }),
                        const SizedBox(
                          width: 40,
                        ),
                        _myMenuBtn("Data Discussion", () {
                          _animateToIndex(4);
                        }),
                      ],
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton.extended(
                      onPressed: () {
                        _animateToIndex(1);
                      },
                      label: const Text("Get Started")),
                )
            ],
          ),
        ),
      );
    });
  }

  void _animateToIndex(num i) => _controller!.animateTo(_height * i,
      duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
}

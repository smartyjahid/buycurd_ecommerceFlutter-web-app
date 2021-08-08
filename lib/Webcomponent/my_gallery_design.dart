import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:it_nobel/Util/global_variable.dart';
import 'package:universal_html/html.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Data/WebsiteImageLibrary.dart';
import 'package:it_nobel/Util/common_method.dart';

///Carousel of website design
class GalleryCaraousel extends StatefulWidget {
  ///constructor
  const GalleryCaraousel(this._myHeight);
  final double _myHeight;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GalleryCaraouselState();
  }
}

///state class
class GalleryCaraouselState extends State<GalleryCaraousel> {
  List<MyImage>? _strArr1;
  List<MyImage>? _strArr2;
  List<MyImage>? _strArr3;
  List<MyImage>? _strArr4;
  List<MyImage>? _strArr5;
  List<MyImage>? _strArr6;

  bool startCarasoulNow = false;
  String _designType = "Artistic";

  final int _smeListSize = 106;
  @override
  void initState() {
    super.initState();
    _strArr1 = myArtisticList;
    _strArr2 = myBlogList;
    _strArr3 = myEventList;
    _strArr4 = myPortfolioList;
    _strArr5 = mySMEList;
    _strArr6 = myArtisticList;
  }

  List<MyImage>? _myDesignArr(String myTitle) {
    if (myTitle == "Artistic") {
      _strArr6 = myArtisticList;
    } else if (myTitle == "Blog") {
      _strArr6 = myBlogList;
    } else if (myTitle == "Event") {
      _strArr6 = myEventList;
    } else if (myTitle == "Portfolio") {
      _strArr6 = myPortfolioList;
    } else {
      _strArr6 = mySMEList;
    }
  }

  Widget _myColorAnimText(double galleryHeight, String myText) {
    const List<Color> colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const TextStyle colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );
    return Container(
      width: galleryHeight,
      height: galleryHeight / 2,
      color: Colors.white,
      child: TextButton(
        onPressed: () {},
        child: AnimatedTextKit(
          animatedTexts: <AnimatedText>[
            ColorizeAnimatedText(
              myText,
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          onTap: () {
            printDebug("$myText clicked");
            _designType = myText;
            _myDesignArr(myText);
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double galleryHeight = widget._myHeight;
    const TextStyle colorizeTextStyle = TextStyle(
        fontSize: 30.0, fontFamily: 'Horizon', color: Colors.blueGrey);
    return (!startCarasoulNow)
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      startCarasoulNow = true;
                      setState(() {});
                    },
                    child: const Text(
                        "Click me to see slide show of website template",
                        style: colorizeTextStyle))),
          )
        : isNotDesktopView
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: galleryHeight + 2.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (_designType == "Artistic")
                          Text(
                            _designType,
                            style: colorizeTextStyle,
                          )
                        else
                          _myColorAnimText(galleryHeight, "Artistic"),
                        if (_designType == "Blog")
                          Text(
                            _designType,
                            style: colorizeTextStyle,
                          )
                        else
                          _myColorAnimText(galleryHeight, "Blog"),
                        if (_designType == "Event")
                          Text(
                            _designType,
                            style: colorizeTextStyle,
                          )
                        else
                          _myColorAnimText(galleryHeight, "Event"),
                        if (_designType == "Portfolio")
                          Text(
                            _designType,
                            style: colorizeTextStyle,
                          )
                        else
                          _myColorAnimText(galleryHeight, "Portfolio"),
                        if (_designType == "Business")
                          Text(
                            _designType,
                            style: colorizeTextStyle,
                          )
                        else
                          _myColorAnimText(galleryHeight, "Business"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider.builder(
                      itemCount: _smeListSize,
                      options: CarouselOptions(
                        height: galleryHeight,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: null,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          _myIndividualCarasoul(
                              galleryHeight, _strArr6!, itemIndex),
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _myColorAnimText(galleryHeight, "Artistic"),
                        _myColorAnimText(galleryHeight, "Blog"),
                        _myColorAnimText(galleryHeight, "Event"),
                        _myColorAnimText(galleryHeight, "Portfolio"),
                        _myColorAnimText(galleryHeight, "Business"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 265,
                    child: CarouselSlider.builder(
                        itemCount: _smeListSize,
                        options: CarouselOptions(
                          height: 265,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: null,
                          scrollDirection: Axis.vertical,
                        ),
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _myIndividualCarasoul(
                                    galleryHeight, _strArr1!, itemIndex),
                                _myIndividualCarasoul(
                                    galleryHeight, _strArr2!, itemIndex),
                                _myIndividualCarasoul(
                                    galleryHeight, _strArr3!, itemIndex),
                                _myIndividualCarasoul(
                                    galleryHeight, _strArr4!, itemIndex),
                                _myIndividualCarasoul(
                                    galleryHeight, _strArr5!, itemIndex),
                              ],
                            )),
                  )
                ],
              );
  }
}

/// class to get network image
class MyImage extends StatelessWidget {
  ///constructor
  const MyImage(this._myUrl);
  final String _myUrl;
  @override
  Widget build(BuildContext context) {
    final String imageUrl = _myUrl;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}

Widget _myIndividualCarasoul(
    double galleryHeight, List<MyImage> _strArr, int itemIndex) {
  return SizedBox(
    width: galleryHeight,
    height: galleryHeight,
    child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi / 5)
          ..rotateX(-pi / 5)
          ..translate(40),
        child: _strArr[itemIndex % _strArr.length]),
  );
}

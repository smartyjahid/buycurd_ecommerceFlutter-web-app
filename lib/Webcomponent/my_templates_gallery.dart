import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:it_nobel/Data/WebsiteImageLibrary.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'my_gallery_design.dart';

/// custom widget to make template gallery
class ImageGallery extends StatefulWidget {
  ///constructor
  const ImageGallery(this._myHeight, this._imageWidth);
  final double _myHeight;
  final double _imageWidth;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageGalleryState();
  }
}

/// custom widget to make template gallery
class ImageGalleryState extends State<ImageGallery> {
  List<MyImage>? _strArr6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _strArr6 = myArtisticList;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double galleryHeight = widget._imageWidth;
    return SizedBox(
      height: widget._myHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: <Widget>[
            ..._strArr6!.map((MyImage e) {
              return SizedBox(
                width: galleryHeight,
                height: galleryHeight,
                child: e,
              );
            }).toList()
          ],
        ),
      ),
    );
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
          child: _strArr[itemIndex]),
    );
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
            _myDesignArr(myText);
            setState(() {});
          },
        ),
      ),
    );
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
}

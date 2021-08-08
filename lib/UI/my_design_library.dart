
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';
import 'package:it_nobel/Webcomponent/my_gallery_design.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_nobel/Webcomponent/my_templates_gallery.dart';

/// this page will show the caraousel view of different website design category
class MyDesignLibrary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDesignLibraryState();
  }

}
class MyDesignLibraryState extends State<MyDesignLibrary>{

  bool isViewFullGallery=false;
  Widget _myWebsiteType(){
    return SizedBox(
        height: 350,
        width: 1000,
        child: _myDesignType1()
    );
  }

  Widget _myDesignType1(){

    const double myHeight = 150;
    return  const Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white,
      child: GalleryCaraousel(myHeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const TextStyle colorizeTextStyle = TextStyle(
        fontSize: 30.0,
        fontFamily: 'Horizon',
        color: Colors.blueGrey
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(selectDesign,
              style: GoogleFonts.play(
                  fontStyle: FontStyle.normal,fontSize: 60,
                  fontWeight: FontWeight.bold,color: myTitleTextColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(selectDesignSub1,
              style: GoogleFonts.dancingScript(
                  fontStyle: FontStyle.normal,
                  fontSize: 25,color: mySubTitleTextColor),),
          ),
          const SizedBox(
            height: 20,
          ),
         _myWebsiteType(),


          // myDesignType(),
          // myDesignType(),
        ],
      ),
    );
  }

}



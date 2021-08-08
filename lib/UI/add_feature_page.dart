
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/global_variable.dart' ;
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Webcomponent/my_filter_chips.dart';
import 'package:google_fonts/google_fonts.dart';

/// this page will show the add feature aspect
class AddFeaturePage extends StatelessWidget{

  Widget _myFeatureOption(BuildContext context){
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Container(
          width: 800,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          // height: 100,
          child: Wrap(
            //direction: Axis.vertical,

            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.00,
            runSpacing: 20.00,
            children: <Widget>[...websiteFullFeature.map((String e) {
                  return MyFilterChip(e,(){
                    printDebug("$e filter clicked");
                    printDebug("selected list= $websiteFeature");
                  });
                }).toList()


            ],
          ),
        ),
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
            child: Text(addFeature,
              style: GoogleFonts.play(fontStyle: FontStyle.normal,
                  fontSize: 60,fontWeight: FontWeight.bold,
                  color: myTitleTextColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(addFeatureSub1,
              style: GoogleFonts.dancingScript(fontStyle: FontStyle.normal,
                  fontSize: 25,color:mySubTitleTextColor),),
          ),
          const SizedBox(
            height: 30,
          ),
          _myFeatureOption(context),
          // myDesignType(),
          // myDesignType(),
        ],
      ),
    );
  }

}


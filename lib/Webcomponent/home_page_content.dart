

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';
import 'package:it_nobel/Webcomponent/my_text_designs.dart';
import 'package:google_fonts/google_fonts.dart';

/// this component will be provide text content for home page
class HomePageContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 40),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
           Align(
             alignment: Alignment.centerLeft,
             child: Text(createWeb,
               style: GoogleFonts.play(
                   fontStyle: FontStyle.normal,
                   fontSize: decideMyLayoutDouble(<double>[60,35,30]),
                   fontWeight: FontWeight.bold,color: myTitleTextColor),
             ),

           ),
           SizedBox(
            height: decideMyLayoutDouble(<double>[20,20,0]),
          ),
          if (isNotDesktopView) Container() else Align(
             alignment: Alignment.centerLeft,
             child: myMainTitleSub(createWebSub)
           ),
          const SizedBox(
            height: 20,
          ),
           
        ],
      ),
    );
  }


}
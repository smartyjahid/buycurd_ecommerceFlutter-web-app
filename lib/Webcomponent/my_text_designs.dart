

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';

///animated text liquid
Widget animeLiquidText(String str){
  return DefaultTextStyle(
    style: GoogleFonts.play(
        fontStyle: FontStyle.normal,
        fontSize: decideMyLayoutDouble(<double>[60,35,60]),
        fontWeight: FontWeight.bold,color: myTitleTextColor),
    child: AnimatedTextKit(
      animatedTexts: <AnimatedText>[
      TypewriterAnimatedText(str),
      ],
      onTap: () {
        printDebug("Tap Event");
      },
      repeatForever: true,

    ),
  );
}
/// text style for main title sub
Widget myMainTitleSub(String str){
  return Text(str,
    style: GoogleFonts.dancingScript(fontStyle: FontStyle.normal,
        fontSize: decideMyLayoutDouble(<double>[25,16,10]),
        color: mySubTitleTextColor),);
}

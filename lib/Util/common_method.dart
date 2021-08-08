
import 'package:flutter/material.dart';
import "package:it_nobel/Util/global_variable.dart" ;

/// to avoid print statement in prod
void printDebug(String str){
  if(!isProd){
    print(str);
  }
}

///changing layout for specific cases on device width basis
///double in map is value ton be returned if deviceWidth less than int value
double decideMyLayoutDouble(List<double> myDoubleList){

  double _mySelectedDouble= myDoubleList[2];
  if(myDeviceWidth > screenForLaptop){//desktop View

    _mySelectedDouble= myDoubleList[0];
  }else if(myDeviceWidth > screenForMobile){//laptop View

    _mySelectedDouble= myDoubleList[1];
  }

  return _mySelectedDouble;
}
///double in map is value ton be returned if deviceWidth less than int value
Widget decideMyLayoutWidget(List<Widget> myWidgetList){

  Widget _mySelectedWidget= myWidgetList[2];
  if(myDeviceWidth > screenForLaptop){//desktop View

    _mySelectedWidget=myWidgetList[0];
  }else if(myDeviceWidth > screenForMobile){//laptop View

    _mySelectedWidget=myWidgetList[1];
  }

  return _mySelectedWidget;
}
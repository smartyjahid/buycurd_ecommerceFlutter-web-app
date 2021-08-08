
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/global_variable.dart';

class MyFilterChip extends StatefulWidget {
  String txt;
  Function onSelectFunc;
  MyFilterChip(this.txt,this.onSelectFunc);
  @override
  _MyFilterChipState createState() {
    // TODO: implement createState
    return new _MyFilterChipState();
  }
}

class _MyFilterChipState extends State<MyFilterChip> {
  bool isSelected =false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return FilterChip(
        label: Text(this.widget.txt),
        shape:StadiumBorder(
            side: BorderSide(
                color: Colors.amber
            )
        ),
        selected: isSelected,
        checkmarkColor: Colors.deepPurple,
        disabledColor: Colors.white70,
        selectedColor: Colors.orange,
        onSelected: (bool value) {
          setState(() {
            isSelected=!isSelected;
          });

          if(isSelected){
            websiteFeature.add(this.widget.txt);
          }else{
            websiteFeature.remove(this.widget.txt);
          }

          this.widget.onSelectFunc();
        });
  }


}
import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';

/// this component will be provide
/// different checkbox style- single select ,multi select
class MyCustomCheckBox extends StatefulWidget {
  ///constructor
  const MyCustomCheckBox(
      this.myQuestion, this.checkBoxValuePair, this.mySelection);

  ///different checkbox value pair be store here
  final Map<String, bool> checkBoxValuePair;

  ///the selected value will be store here
  final Function mySelection;

  ///the question to which checkbox has option will be store here
  final String myQuestion;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyCustomCheckBoxState();
  }
}

///State class for above class
class MyCustomCheckBoxState extends State<MyCustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: <Widget>[
          Text(
            widget.myQuestion,
            style: const TextStyle(color: Colors.black),
          ),
          ...widget.checkBoxValuePair.keys.map((String e) {
            return SizedBox(
              width: 160,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black),
                child: CheckboxListTile(
                  title: Text(
                    e,
                    style: const TextStyle(color: Colors.black),
                  ),
                  activeColor: Colors.transparent,
                  checkColor: Colors.blueGrey,
                  selectedTileColor: myTitleTextColor,

                  value: widget.checkBoxValuePair[e],
                  onChanged: (bool? newValue) {
                    printDebug("value checked=$newValue");
                    setState(() {
                      widget.checkBoxValuePair[e] = newValue!;
//replace newValue by widget.checkBoxValuePair[e] daynamic e.g a =a its occur
// issue
                      //   if only single value can be selected then(here
                      // I also Rplace newValue by widget.checkBoxValuePair[e] )
                      if (newValue) {
                        widget.mySelection(e);
                        for (final String element
                            in widget.checkBoxValuePair.keys) {
                          if (e != element) {
                            widget.checkBoxValuePair[element] = false;
                          }
                        }
                      }
                    });
                  },
                  //  leading Checkbox
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

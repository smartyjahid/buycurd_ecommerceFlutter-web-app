import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';
import 'package:it_nobel/Util/global_variable.dart';

/// this component will be provide
/// different checkbox style- single select ,multi select
class MyCustomDropDown extends StatefulWidget {
  ///constructor
  const MyCustomDropDown(
      this.myQuestion, this.dropDownValuePair, this.mySelection);

  ///different checkbox value pair be store here
  final List<String> dropDownValuePair;

  ///the selected value will be store here
  final Function mySelection;

  ///the question to which checkbox has option will be store here
  final String myQuestion;

  /// height of as per the mobile or website....
  @override
  State<StatefulWidget> createState() {
    return MyCustomDropDownState();
  }
}

///State class for above class
class MyCustomDropDownState extends State<MyCustomDropDown> {
  late String _currentSelectedValue;
  late List<String> _dropDownValues;

  @override
  void initState() {
    super.initState();
    _dropDownValues = widget.dropDownValuePair;
    _currentSelectedValue = _dropDownValues[0];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 70,
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                fillColor: Colors.blueGrey,
                filled: false,
                labelStyle: const TextStyle(color: myTitleTextColor),
                labelText: widget.myQuestion,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: const TextStyle(color: myTitleTextColor),
                value: _currentSelectedValue,
                dropdownColor: Colors.blue,
                focusColor: Colors.white,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _currentSelectedValue = newValue!;
                    state.didChange(newValue);
                  });
                  widget.mySelection(newValue);
                },
                items: _dropDownValues.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

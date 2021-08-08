import 'package:flutter/material.dart';
import 'package:it_nobel/Util/common_method.dart';

/// this component will show background ui of page
class BackgroundUI extends StatelessWidget{
/// default constructor
  const BackgroundUI(this._childrenInColumn);

  final List<Widget> _childrenInColumn;

  Text _myText(String str){
    return Text(str,
      style: const TextStyle(color: Colors.white),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: LayoutBuilder(
            builder: (BuildContext context,BoxConstraints constraints) {

              final double screenWidth = constraints.maxWidth ;
              printDebug("screenWidth= $screenWidth");
              return Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.deepPurple,Colors.black]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _myText("Home"),
                          const SizedBox(
                            width: 40,
                          ),
                          _myText("About Us"),
                          const SizedBox(
                            width: 40,
                          ),
                          _myText("Career"),
                          const SizedBox(
                            width: 40,
                          ),
                          _myText("Our Plan /Pricing"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ..._childrenInColumn,
                  ]
                ),
              );

            })
    );
  }

}

// ignore: must_be_immutable
/// container containing images for flip box
class ImageBox extends StatelessWidget{

 /// default constructor
  const ImageBox(this._imagePath,this._mySize);
  final double _mySize;
  final String _imagePath;
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: _mySize,
      height: _mySize,
      child: Image.asset(_imagePath,
      fit: BoxFit.fill,
      ),
    );
  }

}
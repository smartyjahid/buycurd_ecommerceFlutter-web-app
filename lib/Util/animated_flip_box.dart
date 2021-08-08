import "dart:math";

import "package:flutter/animation.dart";
import "package:flutter/material.dart";
import "package:it_nobel/Webcomponent/background_ui.dart";

///This is an animated flip box which can directly used as widget
class AnimationObject extends StatefulWidget {
  /// Default constructor for this class
  const AnimationObject(
      {required this.iconSize,
      required this.sizeHeightMain,
      required this.frontFace,
      required this.textInput,
      required this.textSize});

  ///it tell us the dimension of a face in flip box
  final double sizeHeightMain;

  ///it tell us the icon size of front face of each flip box
  final double iconSize;

  ///it tell us about icon for front face
  final IconData? frontFace;

  ///It tell us text string for a face in flip box
  final String? textInput;

  ///It tell us text font size for a face in flip box
  final double? textSize;

  @override
  State<AnimationObject> createState() {
    // TODO: implement createState
    return AnimationObjectState();
  }
}

/// State class for above class
class AnimationObjectState extends State<AnimationObject>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //ticker provide provide
  // screen refresh rte to _animation
  // controller which use it to control _animation.

  Animation<double>? _animation;

  /// controller provide additional method on _animation like forward and repeat
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    );
    _animation = Tween<double>(begin: 0.0, end: pi * 2).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut))
      ..addListener(() {
        setState(() {});
      });
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.repeat();
    //_animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi / 3),
        child: flipBox(_animation!.value));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  /// designing a flip box without the animation part
  Widget flipBox(num angleValue) {
    // TODO: implement build
    final double sizeHeight = widget.sizeHeightMain;

//    var angleValue=0.0;// move this _animation from 0.0 to pi/2
    /*_animation = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut),
    );*/
    return Stack(
      children: <Widget>[
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(0.0, -(cos(angleValue) * (sizeHeight / 2)),
                (-(sizeHeight / 2) * sin(angleValue)))
            ..rotateX(-(pi / 2) + angleValue),
          alignment: Alignment.center,
          child: FlipBoxContent('assets/images/website1.jpg', sizeHeight),
        ),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(0.0, (sizeHeight / 2) * sin(angleValue),
                -((sizeHeight / 2) * cos(angleValue)))
            ..rotateX(angleValue.toDouble()),
          alignment: Alignment.center,
          child: FlipBoxContent('assets/images/website2.jpg', sizeHeight),
        ),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..translate(
                0.0,
                (sizeHeight / 2) * cos(angleValue), //sin(90+0)=cos0
                ((sizeHeight / 2) * sin(angleValue)))
            ..rotateX(angleValue.toDouble() + (pi / 2)),
          alignment: Alignment.center,
          child: FlipBoxContent('assets/images/website5.jpg', sizeHeight),
        ),
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            //cos(90+0)= -sin0
            ..translate(0.0, -(sizeHeight / 2) * sin(angleValue),
                ((sizeHeight / 2) * cos(angleValue)))
            ..rotateX(angleValue.toDouble() + pi),
          alignment: Alignment.center,
          child: FlipBoxContent('assets/images/website4.jpg', sizeHeight),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

/// To define the face of each side of flip box
class FlipBoxContent extends StatelessWidget {
  /// default constructor
  const FlipBoxContent(this._website, this._mySize);
  final double _mySize;
  final String _website;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ImageBox(_website, _mySize);
  }
}

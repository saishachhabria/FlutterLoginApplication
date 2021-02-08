import 'package:flutter/material.dart';
import 'package:flutter_login/constants.dart';


class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 70.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70.0,
      decoration: BoxDecoration(gradient: gradient,

          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 2),
              spreadRadius: 5,
              blurRadius: 10,

            ),
      ]),
      child: Material(
        shadowColor: Colors.black,
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
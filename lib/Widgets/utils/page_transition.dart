import 'package:flutter/material.dart';

class RightToLeftTransition extends PageRouteBuilder {
  final Widget child;
  RightToLeftTransition({required this.child})
      : super(
          transitionDuration: Duration(milliseconds: 400),
          reverseTransitionDuration: Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }
}

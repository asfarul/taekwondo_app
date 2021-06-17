import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';

class GradientRoundedButton extends StatelessWidget {
  final Widget? child;
  final Gradient? gradient;
  final double height;
  final Function? onPressed;

  const GradientRoundedButton({
    Key? key,
    @required this.child,
    this.gradient,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, midColor, secondaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(80),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(80),
            onTap: () {},
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

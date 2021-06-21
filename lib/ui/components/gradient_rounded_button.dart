import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';

class GradientRoundedButton extends StatelessWidget {
  final Widget? child;
  final double height;
  final VoidCallback? onPressed;

  const GradientRoundedButton({
    Key? key,
    @required this.child,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width * 0.8,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [primaryColor, midColor, secondaryColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(80),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

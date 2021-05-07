import 'package:flutter/material.dart';

class RonudIconButton extends StatelessWidget {
  RonudIconButton({
    @required this.icon,
    @required this.onPressed,
    this.color,
    this.iconColor,
  });
  final IconData icon;
  final Function onPressed;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(height: 35.0, width: 35.0),
      fillColor: color,
      shape: CircleBorder(),
    );
  }
}

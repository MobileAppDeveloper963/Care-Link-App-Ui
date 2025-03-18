import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
  IconData icon;
  double? size;
  Color? color = Colors.black;

  BuildIconButton({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.all(11),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DsIconButton extends StatelessWidget {
  final void Function()? onTap;
  //final DSIcon dsIcon;

  const DsIconButton({
    //required this.dsIcon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //child: dsIcon,
    );
  }
}

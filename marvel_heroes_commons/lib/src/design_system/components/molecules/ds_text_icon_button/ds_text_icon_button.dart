import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/colors/ds_colors.dart';

class DsTextIconButton extends StatelessWidget {
  final String text;

  final void Function()? onTap;
  final DSTextIconEnum dsTextIcon;
  final DSSvgIconsEnum? icon;
  final DSColor color;
  final DSColor? colorIcon;
  final TextDecoration textDecoration;
  final bool isIcone;

  const DsTextIconButton({
    required this.text,
    this.onTap,
    required this.dsTextIcon,
    required this.color,
    this.colorIcon,
    this.icon,
    this.textDecoration = TextDecoration.none,
    this.isIcone = false,
    super.key,
  });

  DSTextStyle get style => dsTextIcon.getTextStyle();

  DSIconSize get size => dsTextIcon.getSizeIcon();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 8,
            ),
            child: Container(),
            // DSText(
            //   text,
            //   style: style.copyWith(
            //     decoration: textDecoration,
            //   ),
            //   color: color,
            // ),
          ),
          // icon != null
          //     ? Visibility(
          //         visible: isIcone,
          //         child:
          //     //     DSIcon(
          //     //       icon: icon!,
          //     //       color: colorIcon,
          //     //       size: size,
          //     //     ),
          //     //   )
          //     // :
          //     const SizedBox(),
        ],
      ),
    );
  }
}

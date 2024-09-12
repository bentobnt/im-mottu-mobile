import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_heigth_size.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_width_size.dart';

class DSButton extends StatelessWidget {
  final void Function()? onTap;
  final DSButtonTypeEnum type;
  final DSButtonSizeEnum size;
  final DSSvgIconsEnum? icon;

  final String text;
  final bool? isLoading;

  const DSButton({
    required this.text,
    required this.onTap,
    required this.type,
    required this.size,
    this.icon,
    this.isLoading = false,
    super.key,
  });

  bool get isActiveButton => onTap != null;

  DSColor get backgroundColor => type.getBackgroundColor(
        isActiveButton,
      );

  DSColor get borderColor => type.getBorderColor(
        isActiveButton,
      );

  DSColor get textColor => type.getDSTextColor(
        isActiveButton,
      );

  DSColor get circularProgressIndicatorColor =>
      type.getCircularProgressIndicatorColor();

  DSButtonWidth get buttonWidht => size.buttonWidht();

  DSButtonHeight get buttonHeigth => size.buttonHeight();

  DSTextStyle get style => size.getTextStyle();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidht.value,
        height: buttonHeigth.value,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: style.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

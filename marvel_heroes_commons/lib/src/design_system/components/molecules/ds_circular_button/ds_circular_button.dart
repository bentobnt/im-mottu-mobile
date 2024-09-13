import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';

class DSCircularButton extends StatelessWidget {
  final void Function()? onTap;
  final DSCircularButtonNavigatorEnum button;

  const DSCircularButton({
    required this.onTap,
    required this.button,
    super.key,
  });

  bool get isActiveButton => onTap != null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DsWidth.w_48.value,
        height: DsWidth.w_48.value,
        decoration: BoxDecoration(
          color: DSCircularButtonNavigatorStyles.getBackgroundColor(
              isActiveButton),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color:
                DSCircularButtonNavigatorStyles.getBorderColor(isActiveButton),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(DSHeight.h_12.value),
          child: DSSvgIcons.getIcon(
            button.getIcon(),
            size: DSIconSize.small,
            color: DSCircularButtonNavigatorStyles.getIconColor(isActiveButton),
          ),
        ),
      ),
    );
  }
}

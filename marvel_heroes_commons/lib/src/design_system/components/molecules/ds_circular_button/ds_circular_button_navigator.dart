import 'package:flutter/material.dart';
import 'package:marvel_heroes_commons/src/design_system/components/molecules/ds_circular_button/ds_circular_button_navigator_enum.dart';

class DSCircularButtonNavigator extends StatelessWidget {
  final void Function()? onTap;
  final DSCircularButtonNavigatorEnum button;

  const DSCircularButtonNavigator({
    required this.onTap,
    required this.button,
    super.key,
  });

  bool get isActiveButton => onTap != null;

  @override
  Widget build(BuildContext context) {
    return Container();
    // DsCircularButton(
    //   onTap: onTap,
    //   icon: button.getIcon(),
    //   backgroundColor: DSCircularButtonNavigatorStyles.getBackgroundColor(
    //     isActiveButton,
    //   ),
    //   borderColor: DSCircularButtonNavigatorStyles.getBorderColor(
    //     isActiveButton,
    //   ),
    // );
  }
}

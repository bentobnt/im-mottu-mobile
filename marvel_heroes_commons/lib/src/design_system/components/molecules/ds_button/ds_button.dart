import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_heigth_size.dart';
import 'package:marvel_heroes_commons/src/design_system/tokens/sizes/ds_button_width_size.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

// ignore: must_be_immutable
class DSButton extends StatefulWidget {
  final Future Function() onTap;
  final DSButtonTypeEnum type;
  final DSButtonSizeEnum size;
  final DSSvgIconsEnum? icon;

  final String text;
  final bool isActiveButton;

  const DSButton({
    required this.text,
    required this.onTap,
    required this.type,
    required this.size,
    this.isActiveButton = true,
    this.icon,
    super.key,
  });

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  DSColor get backgroundColor =>
      widget.type.getBackgroundColor(widget.isActiveButton);

  DSColor get borderColor => widget.type.getBorderColor(widget.isActiveButton);

  DSColor get textColor => widget.type.getDSTextColor(widget.isActiveButton);

  DSColor get circularProgressIndicatorColor =>
      widget.type.getCircularProgressIndicatorColor();

  DSButtonWidth get buttonWidht => widget.size.buttonWidht();

  DSButtonHeight get buttonHeigth => widget.size.buttonHeight();

  DSTextStyle get style => widget.size.getTextStyle();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return GestureDetector(
      onTap: () async {
        try {
          setState(() => isLoading = true);
          await widget.onTap();
        } catch (_) {
        } finally {
          setState(() => isLoading = false);
        }
      },
      child: Container(
        width: buttonWidht.value,
        height: buttonHeigth.value,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: isLoading == true
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  color: DSColors.secondary,
                  strokeWidth: 3,
                ),
              )
            : Center(
                child: Text(
                  widget.text,
                  style: style.copyWith(
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}

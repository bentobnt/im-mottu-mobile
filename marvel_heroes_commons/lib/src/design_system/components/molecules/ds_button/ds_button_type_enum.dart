import '../../../tokens/colors/ds_colors.dart';

enum DSButtonTypeEnum {
  primary,
  secondary,
  tertiary;

  DSColor getDSTextColor(bool isActive) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
      case DSButtonTypeEnum.secondary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
    }
  }

  DSColor getBackgroundColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
      case DSButtonTypeEnum.secondary:
        return DSColors.transparent;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
    }
  }

  DSColor getBorderColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
      case DSButtonTypeEnum.secondary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.primary : DSColors.desactivateButton;
    }
  }

  DSColor getCircularProgressIndicatorColor() {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return DSColors.primary;
      case DSButtonTypeEnum.secondary:
        return DSColors.primary;
      case DSButtonTypeEnum.tertiary:
        return DSColors.primary;
    }
  }
}

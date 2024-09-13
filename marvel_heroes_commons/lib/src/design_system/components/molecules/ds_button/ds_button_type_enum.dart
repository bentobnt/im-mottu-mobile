import '../../../tokens/colors/ds_colors.dart';

enum DSButtonTypeEnum {
  primary,
  secondary,
  tertiary;

  DSColor getDSTextColor(bool isActive) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.secondary:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.tertiary : DSColors.tertiaryDesactivated;
    }
  }

  DSColor getBackgroundColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.secondary:
        return DSColors.transparent;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.tertiary : DSColors.tertiaryDesactivated;
    }
  }

  DSColor getBorderColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.secondary:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.tertiary:
        return isActive ? DSColors.tertiary : DSColors.tertiaryDesactivated;
    }
  }

  DSColor getCircularProgressIndicatorColor() {
    switch (this) {
      case DSButtonTypeEnum.primary:
        return DSColors.primary;
      case DSButtonTypeEnum.secondary:
        return DSColors.primary;
      case DSButtonTypeEnum.tertiary:
        return DSColors.tertiary;
    }
  }
}

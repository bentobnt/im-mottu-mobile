import '../../../tokens/colors/ds_colors.dart';

enum DSButtonTypeEnum {
  normal,
  outlined;

  DSColor getDSTextColor(bool isActive) {
    switch (this) {
      case DSButtonTypeEnum.normal:
        return isActive ? DSColors.white : DSColors.divider;
      case DSButtonTypeEnum.outlined:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
    }
  }

  DSColor getBackgroundColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.normal:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
      case DSButtonTypeEnum.outlined:
        return DSColors.transparent;
    }
  }

  DSColor getBorderColor(
    bool isActive,
  ) {
    switch (this) {
      case DSButtonTypeEnum.normal:
      case DSButtonTypeEnum.outlined:
        return isActive ? DSColors.primary : DSColors.primaryDesactivated;
    }
  }
}

import 'package:marvel_heroes_commons/marvel_heroes_commons.dart';
import 'package:marvel_heroes_core/marvel_heroes_core.dart';

class BottomSheetWidget {
  static Future<dynamic> show({
    required Widget child,
    bool showCloseButton = true,
  }) async {
    return await Get.bottomSheet(
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DSHeight.h_16.value),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showCloseButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: DSSvgIcons.getIcon(
                          DSSvgIconsEnum.close,
                          color: DSColors.primary,
                          size: DSIconSize.medium,
                        ),
                        onTap: () => Get.close(1),
                      ),
                    ],
                  ),
                SizedBox(height: DSHelper.height * .01),
                child,
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: DSColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(DSHelper.width * .03),
          topRight: Radius.circular(DSHelper.width * .03),
        ),
      ),
    );
  }
}

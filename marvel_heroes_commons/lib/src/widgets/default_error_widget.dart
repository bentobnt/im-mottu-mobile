import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../marvel_heroes_commons.dart';

// ignore: must_be_immutable
class DefaultErrorWidget extends StatelessWidget {
  String? title;
  String? subTitle;
  DSPngImagesEnum? image;
  final Future Function()? tryAgainPressed;

  DefaultErrorWidget({
    this.tryAgainPressed,
    this.title,
    this.subTitle,
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DsWidth.w_32.value),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSImages.getImage(
            image ?? DSPngImagesEnum.error,
            size: DSSizesWidths.dsw_112,
          ),
          SizedBox(
            height: DSHeight.h_32.value,
          ),
          Text(
            title ?? 'Algo de errado aconteceu',
            textAlign: TextAlign.center,
            style: DSTextStyle.subtitle.copyWith(
              color: DSColors.primary,
            ),
          ),
          SizedBox(
            height: DSHeight.h_16.value,
          ),
          Text(
            subTitle ??
                'No momento não conseguimos carregar as informações, mas não se preocupe, nosso heróis já estão resolvendo o problema, tente novamente mais tarde',
            textAlign: TextAlign.center,
            style: DSTextStyle.body2,
          ),
          Visibility(
            visible: tryAgainPressed != null,
            child: SizedBox(
              height: DSHeight.h_32.value,
            ),
          ),
          Visibility(
            visible: tryAgainPressed != null,
            child: DSButton(
              text: 'Tentar novamente',
              onTap: tryAgainPressed ?? () async {},
              type: DSButtonTypeEnum.outlined,
              size: DSButtonSizeEnum.big,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import '../../marvel_heroes_commons.dart';

class DefaultErrorWidget extends StatelessWidget {
  final Function() tryAgainPressed;

  const DefaultErrorWidget({required this.tryAgainPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DsWidth.w_32.value),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSImages.getImage(
            DSPngImagesEnum.error,
            size: DSSizesWidths.dsw_112,
          ),
          SizedBox(
            height: DSHeight.h_48.value,
          ),
          Text(
            'Algo de errado aconteceu',
            textAlign: TextAlign.center,
            style: DSTextStyle.subtitle.copyWith(
              color: DSColors.primary,
            ),
          ),
          SizedBox(
            height: DSHeight.h_16.value,
          ),
          Text(
            'No momento não conseguimos carregar as informações, mas não se preocupe, nosso heróis já estão resolvendo o problema, tente novamente mais tarde',
            textAlign: TextAlign.center,
            style: DSTextStyle.body2,
          ),
          SizedBox(
            height: DSHeight.h_48.value,
          ),
          // OutlinedButtonDSWidget(
          //   text: 'Tentar novamente',
          //   onTap: () => tryAgain.call(),
          //   color: GuideColors.colorStrongOrange,
          // ),
        ],
      ),
    );
  }
}

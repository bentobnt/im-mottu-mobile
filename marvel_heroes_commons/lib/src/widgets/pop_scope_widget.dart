import 'dart:io';

import 'package:flutter/material.dart';

class PopScopeWidget extends StatelessWidget {
  final Widget child;
  final WillPopCallback? onWillPop;
  final bool blockGesture;

  const PopScopeWidget({
    super.key,
    required this.child,
    this.onWillPop,
    this.blockGesture = false,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS && !blockGesture
        ? GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.globalPosition.dx < 60 && onWillPop != null) {
                onWillPop!.call();
              }
            },
            child: WillPopScope(
              onWillPop: onWillPop,
              child: child,
            ),
          )
        : WillPopScope(
            onWillPop: onWillPop,
            child: child,
          );
  }
}

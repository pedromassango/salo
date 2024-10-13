import 'package:flutter/material.dart';

void showAppBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  double height = 330.0,
}) {
  showModalBottomSheet(
    context: context,
    constraints: BoxConstraints(
      maxHeight: height + 30,
    ),
    builder: (context) {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: height,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: const Color(0xffC0C0C6),
            ),
          ),
          child: builder(context),
        ),
      );
    },
    isDismissible: true,
    clipBehavior: Clip.none,
    barrierColor: Colors.black26,
    backgroundColor: Colors.transparent,
  );
}

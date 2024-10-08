import 'package:flutter/material.dart';

const primaryColor = Color(0xff0A361D);
const accentColor = Color(0xffD4ED31);

extension ContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class SaloButton extends StatelessWidget {
  const SaloButton({
    super.key,
    required this.isPrimary,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.height,
  });

  const SaloButton.primary({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.height,
  }) : isPrimary = true;

  final bool isPrimary;
  final String title;
  final double? height;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isAccentBgColor = (backgroundColor ?? primaryColor) == accentColor;
    final textColor = isAccentBgColor ? primaryColor : accentColor;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          shape: LinearBorder.none,
          foregroundColor: primaryColor,
          foregroundBuilder: (context, state, _) => const SizedBox(),
          backgroundBuilder: (context, state, _) {
            final isPressed = state.contains(WidgetState.pressed);
            final isDisabled = state.contains(WidgetState.disabled);
            return Container(
              height: height ?? 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isPrimary
                      ? (backgroundColor ?? Colors.transparent)
                      : Colors.transparent,
                ),
                color: (backgroundColor ?? primaryColor)
                    .withOpacity((isPressed || isDisabled) ? .6 : 1),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                title,
                style: context.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor.withOpacity(isDisabled ? .6 : 1),
                ),
              ),
            );
          }),
      child: const SizedBox.shrink(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salo/src/shared/resources.dart';
import 'package:salo/src/shared/sheets.dart';

class AppPicker<T> extends StatelessWidget {
  const AppPicker({
    super.key,
    required this.child,
    required this.values,
    required this.onChanged,
    required this.valueTitleBuilder,
  });

  final Widget child;
  final List<T> values;
  final ValueChanged<T> onChanged;
  final String Function(T) valueTitleBuilder;

  void _showPicker(BuildContext context) {
    showAppBottomSheet(
      context: context,
      height: values.length > 10 ? 300 : values.length * 56 + (56),
      builder: (context) {
        return Column(
          children: [
            Container(
              height: 4,
              width: 100,
              margin: const EdgeInsets.only(top: 8, bottom: 24),
              decoration: BoxDecoration(
                color: dividerColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...values.map((value) {
                    return ListItemAction(
                      color: primaryColor,
                      title: valueTitleBuilder(value),
                      onPressed: () {
                        onChanged.call(value);
                        Navigator.pop(context);
                      },
                    );
                  })
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: AbsorbPointer(child: child),
    );
  }
}

class ListItemAction extends StatelessWidget {
  const ListItemAction({
    super.key,
    this.icon,
    this.onPressed,
    this.bold = false,
    this.color,
    required this.title,
  });

  final Widget? icon;
  final String title;
  final Color? color;
  final bool bold;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed == null
            ? null
            : () {
                HapticFeedback.lightImpact();
                onPressed?.call();
              },
        style: ElevatedButton.styleFrom(
          overlayColor: Colors.transparent,
          shape: const RoundedRectangleBorder(),
          backgroundColor: Colors.transparent,
          backgroundBuilder: (context, styles, child) {
            final isPressed = styles.contains(WidgetState.pressed);
            final backgroundColor =
                (isPressed ? buttonBackgroundColor : Colors.transparent);

            return Container(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 12),
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
                          color: color ?? primaryColor,
                        ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}

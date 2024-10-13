import 'package:flutter/material.dart';

const appName = 'Beto';
const primaryColor = Color(0xff0A361D);
const accentColor = Color(0xffD4ED31);
const accentColorAlternative = Colors.blue;
final buttonBackgroundColor = primaryColor.withOpacity(.12);
final dividerColor = buttonBackgroundColor;

extension ContextExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

class SaloButton extends StatelessWidget {
  const SaloButton({
    super.key,
    required this.isPrimary,
    required this.title,
    this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.height,
  });

  const SaloButton.primary({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.textStyle,
    this.height,
  }) : isPrimary = true;

  const SaloButton.text({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    TextStyle? style,
  })  : isPrimary = false,
        textStyle = style,
        backgroundColor = null;

  final bool isPrimary;
  final String title;
  final double? height;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isAccentBgColor = (backgroundColor ?? primaryColor) == accentColor;
    final textColor = isAccentBgColor
        ? primaryColor
        : (isPrimary ? accentColor : Colors.blue);
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

            if (!isPrimary) {
              return Text(
                title,
                style: (textStyle ?? context.textTheme.titleLarge)!.copyWith(
                  fontWeight: FontWeight.bold,
                  color:
                      textColor.withOpacity((isDisabled || isPressed) ? .6 : 1),
                ),
              );
            }

            return Container(
              height: height ?? 60,
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

class AppInputField extends StatefulWidget {
  const AppInputField({
    super.key,
    this.hint,
    this.value,
    this.trailing,
    required this.onChanged,
    this.label,
    this.readOnly = false,
  });

  final String? hint;
  final String? value;
  final bool readOnly;
  final String? label;
  final Widget? trailing;
  final ValueChanged<String> onChanged;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  late final _controller = TextEditingController(
    text: widget.value,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: !widget.readOnly,
      readOnly: widget.readOnly,
      controller: _controller,
      canRequestFocus: !widget.readOnly,
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: context.textTheme.titleMedium!.copyWith(
        fontSize: 20,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        suffixIcon: widget.trailing,
        hintStyle: context.textTheme.titleMedium!.copyWith(
          color: Colors.grey,
          fontSize: 20,
        ),
        labelStyle: context.textTheme.titleMedium!.copyWith(
          color: Colors.grey,
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1.5,
            color: accentColorAlternative,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

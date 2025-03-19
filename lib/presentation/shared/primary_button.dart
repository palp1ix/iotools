import 'package:flutter/material.dart';
import 'package:iotools/core/theme/fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 28,
    this.fontColor,
    this.margin,
  });

  final String text;
  final VoidCallback onPressed;
  final double fontSize;
  final Color? fontColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: margin,

      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: WidgetStateProperty.all(theme.colorScheme.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: AppFonts.getWideMedium(
              size: fontSize,
              color: fontColor ?? Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

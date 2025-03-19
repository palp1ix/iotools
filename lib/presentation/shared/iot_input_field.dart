import 'package:flutter/material.dart';
import 'package:iotools/core/theme/fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    required this.text,
    this.obscureText = false,
    this.icon,
  });
  final String text;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: text,
        hintStyle: AppFonts.getWideMedium(color: Colors.grey, size: 18),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
          gapPadding: 10,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2.0),
          gapPadding: 10,
        ),
      ),
    );
  }
}

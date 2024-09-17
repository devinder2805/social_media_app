import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    super.key,
    required this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyBoardType,
    this.prefixText,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.style,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? prefixText;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      style: style,
      decoration: InputDecoration(
        prefixText: prefixText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffix: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ),
      ),
    );
  }
}

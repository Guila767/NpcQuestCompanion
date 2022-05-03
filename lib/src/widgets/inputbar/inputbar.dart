import 'package:flutter/material.dart';

class Inputbar extends StatelessWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final Color borderColor;

  const Inputbar(
    {
      required this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.borderColor = const Color.fromRGBO(210, 210, 210, 1.0),
      this.controller,
      Key? key
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color.fromRGBO(136, 152, 170, 1.0),
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      autofocus: autofocus,
      style: TextStyle(height: 0.55, fontSize: 13.0, color: Colors.grey.shade600),
      textAlignVertical: const TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(154, 154, 154, 1.0),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(
              color: borderColor, width: 1.0, style: BorderStyle.solid)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(
              color: borderColor, width: 1.0, style: BorderStyle.solid)
          ),
          hintText: placeholder
        )
      );
  }
}

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final EdgeInsetsGeometry? margin;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ??
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: onChanged,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontFamily: 'GeneralFont',
          fontSize: 16,
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'GeneralFont',
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 22,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.15),
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}

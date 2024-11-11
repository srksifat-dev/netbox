import 'package:flutter/material.dart';

FilledButton customFilledButton(
    {required BuildContext context,
      required Color backgroundColor,
      required Color foregroundColor,
      required IconData icon,
      required String label,
      required void Function()? onPressed}) {
  return FilledButton.icon(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(backgroundColor),
      foregroundColor: WidgetStatePropertyAll(foregroundColor),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      iconSize: const WidgetStatePropertyAll(40),
      textStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      minimumSize: const WidgetStatePropertyAll(
        Size(double.infinity, 60),
      ),
    ),
    onPressed: onPressed,
    label: Text(label),
    icon: Icon(
      icon,
    ),
  );}
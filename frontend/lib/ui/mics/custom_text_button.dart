import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isFullWidth;
  final BorderRadius? borderRadius;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

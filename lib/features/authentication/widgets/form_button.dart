import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final VoidCallback onPressed;
  final String? text;

  const FormButton({
    super.key,
    required this.disabled,
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
          decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade400
                : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Sizes.size5),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(microseconds: 500),
            style: TextStyle(
              color: disabled ? Colors.grey.shade600 : Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
            child: Text(
              text == null ? "Next" : text!,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class TutorialMessage extends StatelessWidget {
  final String title, contents;

  const TutorialMessage({
    super.key,
    required this.title,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v52,
          Text(
            title,
            style: const TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v16,
          Text(
            contents,
            style: const TextStyle(
              fontSize: Sizes.size20,
            ),
          ),
        ],
      ),
    );
  }
}

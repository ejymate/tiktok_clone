import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 40,
            width: 24,
            decoration: BoxDecoration(
              color: const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size16),
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 40,
            width: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size16),
            ),
          ),
        ),
        Container(
          height: 40,
          padding: const EdgeInsets.all(
            Sizes.size8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size5),
          ),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size24,
            ),
          ),
        ),
      ],
    );
  }
}

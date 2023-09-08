import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_message.dart';

import '../../constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showPage = Page.first;

  void _onPanUpdate(DragUpdateDetails dragDetail) {
    final currentDirection = _direction;

    if (dragDetail.delta.dx > 0) {
      _direction = Direction.right;
    } else {
      _direction = Direction.left;
    }

    if (currentDirection != _direction) {
      setState(() {});
    }
  }

  void _onPanEnd(DragEndDetails dragDetail) {
    final currentPage = _showPage;

    if (_direction == Direction.right) {
      _showPage = Page.first;
    } else {
      _showPage = Page.second;
    }

    if (currentPage != _showPage) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const TutorialMessage(
                title: "Watch cool video!",
                contents:
                    "Videos are personalized for you based on what you watch, like, and share.",
              ),
              secondChild: const TutorialMessage(
                title: "Follow the rules",
                contents: "blablabla...",
              ),
              crossFadeState: _showPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
            ),
          ),
        ),
        bottomNavigationBar: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: _showPage == Page.first ? 0 : 1,
          child: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size24,
                horizontal: Sizes.size24,
              ),
              child: CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: const Text("Enter the app!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

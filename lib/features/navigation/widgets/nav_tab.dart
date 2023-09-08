import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatefulWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.isSelectedIcon,
  });

  final String text;
  final IconData icon;
  final IconData isSelectedIcon;
  final bool isSelected;
  final Function onTap;

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  bool _isClicked = false;

  void _onTapUp(TapUpDetails detail) {
    setState(() {
      _isClicked = false;
    });
  }

  void _onTapDown(TapDownDetails detail) {
    setState(() {
      _isClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        // behavior: HitTestBehavior.translucent,
        onTap: () => widget.onTap(),
        onTapUp: _onTapUp,
        onTapDown: _onTapDown,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: widget.isSelected ? 1 : 0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: _isClicked ? Colors.grey.shade800 : Colors.black,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  widget.isSelected ? widget.isSelectedIcon : widget.icon,
                  color: Colors.white,
                ),
                Gaps.v5,
                Text(
                  widget.text,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/navigation/stf_screen.dart';
import 'package:tiktok_clone/features/navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record Viedo!"),
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          padding: const EdgeInsets.all(Sizes.size12),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "Home",
                icon: FontAwesomeIcons.house,
                isSelectedIcon: FontAwesomeIcons.house,
                isSelected: _currentIndex == 0,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "Discover",
                icon: FontAwesomeIcons.compass,
                isSelectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _currentIndex == 1,
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                text: "Home",
                icon: FontAwesomeIcons.message,
                isSelectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _currentIndex == 3,
                onTap: () => _onTap(3),
              ),
              NavTab(
                text: "Home",
                icon: FontAwesomeIcons.user,
                isSelectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _currentIndex == 4,
                onTap: () => _onTap(4),
              )
            ],
          )),
    );
  }
}

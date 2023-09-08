import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _counter = 0;

  void _upCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Counter: $_counter",
            style: const TextStyle(fontSize: 48),
          ),
          Gaps.v5,
          FractionallySizedBox(
            widthFactor: 0.5,
            child: CupertinoButton(
              onPressed: _upCounter,
              color: Theme.of(context).primaryColor,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.add),
                  Gaps.h5,
                  Text("Add"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

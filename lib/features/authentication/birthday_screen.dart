import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

import '../onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  final DateTime _today = DateTime.now();
  late DateTime initialDate;

  @override
  void initState() {
    super.initState();

    final maximumYear = _today.year - 12;
    initialDate = DateTime.parse("$maximumYear-01-01");
    _setBirthdayText(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setBirthdayText(DateTime date) {
    final todayString = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: todayString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "When's your birthday?",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gaps.v8,
                      Text(
                        "your birthday won't be shown publicly",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FaIcon(
                    FontAwesomeIcons.cakeCandles,
                    size: Sizes.size80,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Gaps.v16,
            TextField(
              controller: _birthdayController,
              enabled: false,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v28,
            FormButton(onPressed: _onNextTap, disabled: false),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 300,
        child: BottomAppBar(
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) => _setBirthdayText(value),
          ),
        ),
      ),
    );
  }
}

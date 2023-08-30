import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLengthValid() {
    return _password.isNotEmpty &&
        _password.length > 7 &&
        _password.length < 21;
  }

  bool _isPasswordCheckValid() {
    final regExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]*$');
    return regExp.hasMatch(_password);
  }

  void _onSubmit() {
    if (!_isPasswordLengthValid() || !_isPasswordCheckValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onCLearTextTap() {
    _passwordController.clear();
  }

  void _onObscureTextTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text(
                "Create Password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "Make it strong!",
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onCLearTextTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: Sizes.size20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gaps.h20,
                      GestureDetector(
                        onTap: _onObscureTextTap,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16,
                    color: _isPasswordLengthValid()
                        ? Colors.green
                        : Colors.grey.shade500,
                  ),
                  Gaps.h8,
                  const Text("8 to 20 Characters"),
                ],
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size16,
                    color: _isPasswordCheckValid()
                        ? Colors.green
                        : Colors.grey.shade500,
                  ),
                  Gaps.h8,
                  const Text("Letters, numbers, and special characters"),
                ],
              ),
              Gaps.v28,
              FormButton(
                  onPressed: _onSubmit,
                  disabled:
                      !_isPasswordLengthValid() || !_isPasswordCheckValid()),
            ],
          ),
        ),
      ),
    );
  }
}

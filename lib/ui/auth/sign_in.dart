import 'package:bani_bayram/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../images.dart';
import '../../theme/app_theme.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late AuthenticationController controller;
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AuthenticationController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(Images.login, height: 60, width: 60),
            Text(
              'Log In to Account',
              style: Theme.of(context).textTheme.headline5!.copyWith(),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Email')),
              validator: controller.validateEmail,
            ),
            TextFormField(
              obscureText: _hidePassword,
              decoration: InputDecoration(
                label: const Text('Password'),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _hidePassword = !_hidePassword;
                  }),
                  icon: _hidePassword
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
              ),
              validator: controller.validatePassword,
              keyboardType: TextInputType.emailAddress,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text('Forgot Password ?'),
                  onTap: () {},
                )),
            /*const SizedBox(height: 2),*/
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.signIn(context);
                  }
                },
                child: const Text('Log In'),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Divider(),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Or',
                      style: TextStyle(color: AppTheme.mainColor.shade400),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Divider(),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => controller.signInWithGoogle(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Images.google, width: 20),
                    const SizedBox(width: 10),
                    const Text('Log In with Google'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

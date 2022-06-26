import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controllers/auth_controller.dart';
import '../../images.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthenticationController controller;
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hidePassword2 = true;

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
            SvgPicture.asset(Images.signUp, height: 60, width: 60),
            Text(
              'Create Account',
              style: Theme.of(context).textTheme.headline5!.copyWith(),
            ),
            const TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(labelText: 'Prénom'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Nom'),
              textCapitalization: TextCapitalization.words,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Email')),
              validator: controller.validateEmail,
              keyboardType: TextInputType.emailAddress,
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
            ),
            TextFormField(
              obscureText: _hidePassword2,
              decoration: InputDecoration(
                label: const Text('Confirm Password'),
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _hidePassword2 = !_hidePassword2;
                  }),
                  icon: _hidePassword2
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
              ),
              validator: controller.validatePassword,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.signUp(context);
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

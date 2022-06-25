import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../images.dart';
import '../../theme/app_theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
            decoration: InputDecoration(label: Text('FirstName')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Name')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Email')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Password')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Confirm Password')),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}

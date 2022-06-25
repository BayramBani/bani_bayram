import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../images.dart';
import '../../theme/app_notifier.dart';
import '../../theme/app_theme.dart';
import '../../utils/navigation.dart';
import '../home/home.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
          const TextField(
            decoration: InputDecoration(label: Text('Email')),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Password')),
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
                // change to light theme
                Provider.of<AppNotifier>(context, listen: false)
                    .updateTheme(ThemeType.light);
                push(context, const HomePage());
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
              onPressed: () {},
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
    );
  }
}

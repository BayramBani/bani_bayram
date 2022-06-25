import 'package:bani_bayram/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as dev;

import '../../images.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('start');
    return Container(
      //color: AppTheme.theme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            /*const Icon(Icons.person_outline, size: 60, color: Color(0xFFBFAB88)),*/
            SvgPicture.asset(Images.signUp, height: 60, width: 60),
            Text(
              'Log In to Account',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
            const TextField(
              decoration: InputDecoration(label: Text('EMAIL')),
            ),
            const TextField(
              decoration: InputDecoration(label: Text('PASSWORD')),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                )),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.mainColor.shade400,
                  onPrimary: AppTheme.mainColor.shade900,
                ),
                child: const Text('Log In'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Divider(
                    thickness: 3,
                    color: AppTheme.mainColor.shade400,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Or',
                      style: TextStyle(color: AppTheme.mainColor.shade400),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Divider(
                    thickness: 3,
                    color: AppTheme.mainColor.shade400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.mainColor.shade400,
                  onPrimary: AppTheme.mainColor.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Images.google, width: 20),
                    const SizedBox(width: 10),
                    const Text('Log In with Google',style: TextStyle(color: Colors.white),),
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

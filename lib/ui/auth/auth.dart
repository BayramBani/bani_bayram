import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Log in')),
              Tab(child: Text('Sign up')),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SignInPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}

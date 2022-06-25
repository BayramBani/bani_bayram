import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      sideBuilder: (context, constraints) {
        return const Center(child: Text('sideBuilder'));
      },
      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network('https://firebase.flutter.dev/img/flutterfire_300x.png'),
          ),
        );
      },
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId: '875954583146-an632dosa30jilbu16gsmdpk87opi2k6.apps.googleusercontent.com',
        ),
        PhoneProviderConfiguration(),
      ],
    );
  }
}

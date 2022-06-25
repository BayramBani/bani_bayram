import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class CustomSignInWidget extends StatelessWidget {
  const CustomSignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEmailSignInForm(),
    );
  }
}

class CustomEmailSignInForm extends StatelessWidget {
  CustomEmailSignInForm({Key? key}) : super(key: key);

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: AuthFlowBuilder<EmailFlowController>(
          listener: (oldState, state, controller) {
            if (state is SignedIn) {
              Navigator.of(context).pushReplacementNamed('/profile');
            }
          },
          builder: (context, state, controller, _) {
            if (state is AwaitingEmailAndPassword) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(controller: emailCtrl),
                    TextField(controller: passwordCtrl),
                    ElevatedButton(
                      onPressed: () {
                        controller.setEmailAndPassword(
                          emailCtrl.text,
                          passwordCtrl.text,
                        );
                      },
                      child: const Text('Sign in'),
                    ),
                  ],
                ),
              );
            } else if (state is AuthFailed) {
              return ErrorText(exception: state.exception);
            } else if (state is SigningIn) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: CircularProgressIndicator(color: Colors.red));
            }
          },
        ),
      ),
    );
  }
}

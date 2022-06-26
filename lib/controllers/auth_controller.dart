// ignore_for_file: use_build_context_synchronously

import 'package:bani_bayram/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../theme/app_notifier.dart';
import '../theme/app_theme.dart';
import '../ui/home/home.dart';
import '../utils/navigation.dart';

// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

var log = Logger();

class AuthenticationController {
  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return "Saisissez une adresse e-mail";
    } else if (isEmail(text)) {
      return "Veuillez saisir une adresse e-mail valide";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return "Saisissez votre mot de passe";
    }
    return null;
  }

  static bool isEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{1,}))$';
    RegExp regex = RegExp(pattern as String);
    return (!regex.hasMatch(email));
  }

  void signUp(BuildContext context) {
    // change to light theme
    Provider.of<AppNotifier>(context, listen: false).updateTheme(ThemeType.light);
    push(context, const HomePage());
  }

  void signIn(BuildContext context) {
    // change to light theme
    Provider.of<AppNotifier>(context, listen: false).updateTheme(ThemeType.light);
    push(context, const HomePage());
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    UserModel? user = await AuthService().signInWithGoogle();
    AuthService().logCurrentUser();
    log.i(user);
    if (user != null) {
      // change to light theme
      Provider.of<AppNotifier>(context, listen: false).updateTheme(ThemeType.light);
      myFloatingSnackBar(context, "Bienvenue ${user.firstName}");
      push(context, const HomePage());
    } else {
      myFloatingSnackBar(context, "Une erreur s'est produite ");
    }
  }

  void signOut(BuildContext context) {
    AuthService().signOut(context);
    Provider.of<AppNotifier>(context, listen: false).updateTheme(ThemeType.dark);
    SystemNavigator.pop();
  }
}

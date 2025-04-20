// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  // skipped getter for the 'selectLanguage & theme' key

  /// `Select Language :`
  String get selectLanguage {
    return Intl.message(
      'Select Language :',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  // skipped getter for the 'Select Theme' key

  // skipped getter for the 'dark mode' key

  // skipped getter for the 'light mode' key

  // skipped getter for the 'Save and continue' key

  // skipped getter for the 'Manage your tasks' key

  // skipped getter for the 'You can easily manage all of your daily tasks in DoMe for free' key

  // skipped getter for the 'Create daily routines' key

  // skipped getter for the 'In Uptodo  you can create your personalized routine to stay productive' key

  // skipped getter for the 'Orgonaize your tasks' key

  // skipped getter for the 'You can organize your daily tasks by adding your tasks into separate categories' key

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  // skipped getter for the 'Get Started' key

  // skipped getter for the 'Welcome to UpTodo' key

  // skipped getter for the 'Please login to your account or create new account to continue' key

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  // skipped getter for the 'Create account' key

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `User Name`
  String get username {
    return Intl.message('User Name', name: 'username', desc: '', args: []);
  }

  // skipped getter for the 'Forgot password?' key

  // skipped getter for the 'Don\'t have an account?' key

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  // skipped getter for the 'Already have an account?' key

  // skipped getter for the 'Create your account' key

  // skipped getter for the 'Confirm Password' key

  // skipped getter for the 'register with Google' key

  // skipped getter for the 'register with Facebook' key

  // skipped getter for the 'login with Google' key

  // skipped getter for the 'login with Facebook' key

  /// `OR`
  String get OR {
    return Intl.message('OR', name: 'OR', desc: '', args: []);
  }

  // skipped getter for the 'forgot password' key

  // skipped getter for the 'Enter your email address and we will send you a link to reset your password' key

  // skipped getter for the 'reset password' key

  // skipped getter for the 'check your email' key

  // skipped getter for the 'We have sent you an email with a link to reset your password' key

  // skipped getter for the 'verify code' key

  // skipped getter for the 'have not received the code?' key

  // skipped getter for the 'resend code' key

  // skipped getter for the 'password reset' key

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  // skipped getter for the 'your password has been successfully reset . click confirm to set a nem password' key

  // skipped getter for the 'update password' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

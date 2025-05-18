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

  /// `Select Language & Theme`
  String get selectLanguageandtheme {
    return Intl.message(
      'Select Language & Theme',
      name: 'selectLanguageandtheme',
      desc: '',
      args: [],
    );
  }

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

  /// `Select Theme :`
  String get selectTheme {
    return Intl.message(
      'Select Theme :',
      name: 'selectTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkmode {
    return Intl.message('Dark Mode', name: 'darkmode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightmode {
    return Intl.message('Light Mode', name: 'lightmode', desc: '', args: []);
  }

  /// `Save and continue`
  String get saveandcontinue {
    return Intl.message(
      'Save and continue',
      name: 'saveandcontinue',
      desc: '',
      args: [],
    );
  }

  /// `Manage your tasks`
  String get manageyourtasks {
    return Intl.message(
      'Manage your tasks',
      name: 'manageyourtasks',
      desc: '',
      args: [],
    );
  }

  /// `You can easily manage all of your daily tasks in DoMe for free`
  String get youcaneasilymanageallofyourdailytasksinDoMeforfree {
    return Intl.message(
      'You can easily manage all of your daily tasks in DoMe for free',
      name: 'youcaneasilymanageallofyourdailytasksinDoMeforfree',
      desc: '',
      args: [],
    );
  }

  /// `Create daily routines`
  String get createdailyroutines {
    return Intl.message(
      'Create daily routines',
      name: 'createdailyroutines',
      desc: '',
      args: [],
    );
  }

  /// `In Uptodo  you can create your personalized routine to stay productive`
  String get inUptodoyoucancreateyourpersonalizedroutinetostayproductive {
    return Intl.message(
      'In Uptodo  you can create your personalized routine to stay productive',
      name: 'inUptodoyoucancreateyourpersonalizedroutinetostayproductive',
      desc: '',
      args: [],
    );
  }

  /// `Orgonaize your tasks`
  String get orgonaizeyourtasks {
    return Intl.message(
      'Orgonaize your tasks',
      name: 'orgonaizeyourtasks',
      desc: '',
      args: [],
    );
  }

  /// `You can organize your daily tasks by adding your tasks into separate categories`
  String
  get youcanorganizeyourdailytasksbyaddingyourtasksintoseparatecategories {
    return Intl.message(
      'You can organize your daily tasks by adding your tasks into separate categories',
      name:
          'youcanorganizeyourdailytasksbyaddingyourtasksintoseparatecategories',
      desc: '',
      args: [],
    );
  }

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

  /// `GET STARTED`
  String get getStarted {
    return Intl.message('GET STARTED', name: 'getStarted', desc: '', args: []);
  }

  /// `Welcome to Tadweer`
  String get welcometoUpTodo {
    return Intl.message(
      'Welcome to Tadweer',
      name: 'welcometoUpTodo',
      desc: '',
      args: [],
    );
  }

  /// `Please login to your account or create new account to continue`
  String get pleaselogintoyouraccountorcreatenewaccounttocontinue {
    return Intl.message(
      'Please login to your account or create new account to continue',
      name: 'pleaselogintoyouraccountorcreatenewaccounttocontinue',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `CREATE ACCOUNT`
  String get createaccount {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'createaccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `User Name`
  String get username {
    return Intl.message('User Name', name: 'username', desc: '', args: []);
  }

  /// `Please enter your username`
  String get Pleaseenteryourusername {
    return Intl.message(
      'Please enter your username',
      name: 'Pleaseenteryourusername',
      desc: '',
      args: [],
    );
  }

  /// `The field is required`
  String get Thefieldisrequired {
    return Intl.message(
      'The field is required',
      name: 'Thefieldisrequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get Enteravalidemail {
    return Intl.message(
      'Enter a valid email',
      name: 'Enteravalidemail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get Passwordmustbeatleast8characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'Passwordmustbeatleast8characters',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one letter and one number`
  String get Passwordmustcontainatleastoneletterandonenumber {
    return Intl.message(
      'Password must contain at least one letter and one number',
      name: 'Passwordmustcontainatleastoneletterandonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get Passwordsdonotmatch {
    return Intl.message(
      'Passwords do not match',
      name: 'Passwordsdonotmatch',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message('Error', name: 'Error', desc: '', args: []);
  }

  /// `An error occurred. Please try again.`
  String get AnerroroccurredPleasetryagain {
    return Intl.message(
      'An error occurred. Please try again.',
      name: 'AnerroroccurredPleasetryagain',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'forgotpassword?' key

  /// `Don't have an account?`
  String get donthaveanaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyhaveanaccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get createyouraccount {
    return Intl.message(
      'Create your account',
      name: 'createyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmpassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmpassword',
      desc: '',
      args: [],
    );
  }

  /// `register with Google`
  String get registerwithGoogle {
    return Intl.message(
      'register with Google',
      name: 'registerwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `register with Facebook`
  String get registerwithFacebook {
    return Intl.message(
      'register with Facebook',
      name: 'registerwithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get Nouserfoundforthatemail {
    return Intl.message(
      'No user found for that email.',
      name: 'Nouserfoundforthatemail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get Wrongpasswordprovidedforthatuser {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'Wrongpasswordprovidedforthatuser',
      desc: '',
      args: [],
    );
  }

  /// `login with Google`
  String get loginwithGoogle {
    return Intl.message(
      'login with Google',
      name: 'loginwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `login with Facebook`
  String get loginwithFacebook {
    return Intl.message(
      'login with Facebook',
      name: 'loginwithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message('OR', name: 'or', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgotpassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotpassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you a link to reset your password`
  String get enteryouremailaddressandwewillsendyoualinktoresetyourpassword {
    return Intl.message(
      'Enter your email address and we will send you a link to reset your password',
      name: 'enteryouremailaddressandwewillsendyoualinktoresetyourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetpassword {
    return Intl.message(
      'Reset Password',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get checkyouremail {
    return Intl.message(
      'Check your email',
      name: 'checkyouremail',
      desc: '',
      args: [],
    );
  }

  /// `We have sent you an email with a link to reset your password`
  String get wehavesentyouanemailwithalinktoresetyourpassword {
    return Intl.message(
      'We have sent you an email with a link to reset your password',
      name: 'wehavesentyouanemailwithalinktoresetyourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifycode {
    return Intl.message('Verify Code', name: 'verifycode', desc: '', args: []);
  }

  /// `Have not received the code?`
  String get havenotreceivedthecode {
    return Intl.message(
      'Have not received the code?',
      name: 'havenotreceivedthecode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendcode {
    return Intl.message('Resend Code', name: 'resendcode', desc: '', args: []);
  }

  /// `Password Reset`
  String get passwordreset {
    return Intl.message(
      'Password Reset',
      name: 'passwordreset',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Your password has been successfully reset. Click confirm to set a new password`
  String get yourpasswordhasbeensuccessfullyresetclickconfirmtosetanewpassword {
    return Intl.message(
      'Your password has been successfully reset. Click confirm to set a new password',
      name: 'yourpasswordhasbeensuccessfullyresetclickconfirmtosetanewpassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatepassword {
    return Intl.message(
      'Update Password',
      name: 'updatepassword',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get EmailVerification {
    return Intl.message(
      'Email Verification',
      name: 'EmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email address`
  String get Pleaseverifyyouremailaddress {
    return Intl.message(
      'Please verify your email address',
      name: 'Pleaseverifyyouremailaddress',
      desc: '',
      args: [],
    );
  }

  /// `A verification link has been sent to your email`
  String get Averificationlinkhasbeensenttoyouremail {
    return Intl.message(
      'A verification link has been sent to your email',
      name: 'Averificationlinkhasbeensenttoyouremail',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get ResendEmail {
    return Intl.message(
      'Resend Email',
      name: 'ResendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Go to Login`
  String get GotoLogin {
    return Intl.message('Go to Login', name: 'GotoLogin', desc: '', args: []);
  }

  /// `Upload Profile Picture`
  String get UploadProfilePicture {
    return Intl.message(
      'Upload Profile Picture',
      name: 'UploadProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Pick from Gallery`
  String get PickfromGallery {
    return Intl.message(
      'Pick from Gallery',
      name: 'PickfromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Index`
  String get Index {
    return Intl.message('Index', name: 'Index', desc: '', args: []);
  }

  /// `Calendar`
  String get Calendar {
    return Intl.message('Calendar', name: 'Calendar', desc: '', args: []);
  }

  /// `Focus`
  String get Focus {
    return Intl.message('Focus', name: 'Focus', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `What do you want to do today?`
  String get Whatdoyouwanttodotoday {
    return Intl.message(
      'What do you want to do today?',
      name: 'Whatdoyouwanttodotoday',
      desc: '',
      args: [],
    );
  }

  /// `Tap + to add your tasks`
  String get Taptoaddyourtasks {
    return Intl.message(
      'Tap + to add your tasks',
      name: 'Taptoaddyourtasks',
      desc: '',
      args: [],
    );
  }

  /// `Hi , `
  String get Hi {
    return Intl.message('Hi , ', name: 'Hi', desc: '', args: []);
  }

  /// `Tasks Left`
  String get TasksLeft {
    return Intl.message('Tasks Left', name: 'TasksLeft', desc: '', args: []);
  }

  /// `Tasks Done`
  String get TasksDone {
    return Intl.message('Tasks Done', name: 'TasksDone', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `App Settings`
  String get AppSettings {
    return Intl.message(
      'App Settings',
      name: 'AppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message('Account', name: 'Account', desc: '', args: []);
  }

  /// `Change account name`
  String get Changeaccountname {
    return Intl.message(
      'Change account name',
      name: 'Changeaccountname',
      desc: '',
      args: [],
    );
  }

  /// `'New Name`
  String get NewName {
    return Intl.message('\'New Name', name: 'NewName', desc: '', args: []);
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Change account password`
  String get Changeaccountpassword {
    return Intl.message(
      'Change account password',
      name: 'Changeaccountpassword',
      desc: '',
      args: [],
    );
  }

  /// `Change account Image`
  String get ChangeaccountImage {
    return Intl.message(
      'Change account Image',
      name: 'ChangeaccountImage',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LogOut {
    return Intl.message('Log Out', name: 'LogOut', desc: '', args: []);
  }

  /// `Are you sure you want to log out?`
  String get Areyousureyouwanttologout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'Areyousureyouwanttologout',
      desc: '',
      args: [],
    );
  }

  /// `Focus Mode`
  String get FocusMode {
    return Intl.message('Focus Mode', name: 'FocusMode', desc: '', args: []);
  }

  /// `While your focus mode is on, all of your notifications will be off`
  String get Whileyourfocusmodeisonallofyournotificationswillbeoff {
    return Intl.message(
      'While your focus mode is on, all of your notifications will be off',
      name: 'Whileyourfocusmodeisonallofyournotificationswillbeoff',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get Pause {
    return Intl.message('Pause', name: 'Pause', desc: '', args: []);
  }

  /// `Start`
  String get Start {
    return Intl.message('Start', name: 'Start', desc: '', args: []);
  }

  /// `Applications`
  String get Applications {
    return Intl.message(
      'Applications',
      name: 'Applications',
      desc: '',
      args: [],
    );
  }

  /// `Task Name`
  String get TaskName {
    return Intl.message('Task Name', name: 'TaskName', desc: '', args: []);
  }

  /// `Task Details`
  String get TaskDetails {
    return Intl.message(
      'Task Details',
      name: 'TaskDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add New Task`
  String get AddNewTask {
    return Intl.message('Add New Task', name: 'AddNewTask', desc: '', args: []);
  }

  /// `Add Task`
  String get AddTask {
    return Intl.message('Add Task', name: 'AddTask', desc: '', args: []);
  }

  /// `Overview`
  String get Overview {
    return Intl.message('Overview', name: 'Overview', desc: '', args: []);
  }

  /// `This Week`
  String get ThisWeek {
    return Intl.message('This Week', name: 'ThisWeek', desc: '', args: []);
  }

  /// `SUN`
  String get SUN {
    return Intl.message('SUN', name: 'SUN', desc: '', args: []);
  }

  /// `MON`
  String get MON {
    return Intl.message('MON', name: 'MON', desc: '', args: []);
  }

  /// `TUE`
  String get TUE {
    return Intl.message('TUE', name: 'TUE', desc: '', args: []);
  }

  /// `WED`
  String get WED {
    return Intl.message('WED', name: 'WED', desc: '', args: []);
  }

  /// `THU`
  String get THU {
    return Intl.message('THU', name: 'THU', desc: '', args: []);
  }

  /// `FRI`
  String get FRI {
    return Intl.message('FRI', name: 'FRI', desc: '', args: []);
  }

  /// `SAT`
  String get SAT {
    return Intl.message('SAT', name: 'SAT', desc: '', args: []);
  }

  /// `Select Date :`
  String get SelectDate {
    return Intl.message(
      'Select Date :',
      name: 'SelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Category :`
  String get SelectCatogry {
    return Intl.message(
      'Select Category :',
      name: 'SelectCatogry',
      desc: '',
      args: [],
    );
  }

  /// `Grocery`
  String get categoryGrocery {
    return Intl.message('Grocery', name: 'categoryGrocery', desc: '', args: []);
  }

  /// `Work`
  String get categoryWork {
    return Intl.message('Work', name: 'categoryWork', desc: '', args: []);
  }

  /// `Sport`
  String get categorySport {
    return Intl.message('Sport', name: 'categorySport', desc: '', args: []);
  }

  /// `Design`
  String get categoryDesign {
    return Intl.message('Design', name: 'categoryDesign', desc: '', args: []);
  }

  /// `University`
  String get categoryUniversity {
    return Intl.message(
      'University',
      name: 'categoryUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get categorySocial {
    return Intl.message('Social', name: 'categorySocial', desc: '', args: []);
  }

  /// `Music`
  String get categoryMusic {
    return Intl.message('Music', name: 'categoryMusic', desc: '', args: []);
  }

  /// `Health`
  String get categoryHealth {
    return Intl.message('Health', name: 'categoryHealth', desc: '', args: []);
  }

  /// `Movie`
  String get categoryMovie {
    return Intl.message('Movie', name: 'categoryMovie', desc: '', args: []);
  }

  /// `Home`
  String get categoryHome {
    return Intl.message('Home', name: 'categoryHome', desc: '', args: []);
  }

  /// `Save Changes`
  String get SaveChanges {
    return Intl.message(
      'Save Changes',
      name: 'SaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Change Date`
  String get ChangeDate {
    return Intl.message('Change Date', name: 'ChangeDate', desc: '', args: []);
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Details`
  String get Details {
    return Intl.message('Details', name: 'Details', desc: '', args: []);
  }

  /// `Edit Task`
  String get EditTask {
    return Intl.message('Edit Task', name: 'EditTask', desc: '', args: []);
  }

  /// `A password reset email has been sent. Please check your inbox or spam folder`
  String get ApasswordresetemailhasbeensentPleasecheckyourinboxorspamfolder {
    return Intl.message(
      'A password reset email has been sent. Please check your inbox or spam folder',
      name: 'ApasswordresetemailhasbeensentPleasecheckyourinboxorspamfolder',
      desc: '',
      args: [],
    );
  }

  /// `This email is not registered with us. Please make sure it is correct or create a new account`
  String
  get ThisemailisnotregisteredwithusPleasemakesureitiscorrectorcreateanewaccount {
    return Intl.message(
      'This email is not registered with us. Please make sure it is correct or create a new account',
      name:
          'ThisemailisnotregisteredwithusPleasemakesureitiscorrectorcreateanewaccount',
      desc: '',
      args: [],
    );
  }

  /// `Loading.........`
  String get Loading {
    return Intl.message(
      'Loading.........',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `No Tasks for This day!`
  String get NotasksforThisday {
    return Intl.message(
      'No Tasks for This day!',
      name: 'NotasksforThisday',
      desc: '',
      args: [],
    );
  }

  /// `Let’s add some Tasks and stay productive`
  String get LetsaddsomeTasksandstayproductive {
    return Intl.message(
      'Let’s add some Tasks and stay productive',
      name: 'LetsaddsomeTasksandstayproductive',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get Takeaphoto {
    return Intl.message('Take a photo', name: 'Takeaphoto', desc: '', args: []);
  }

  /// `Choose from Gallery`
  String get ChoosefromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'ChoosefromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Remove Profile Picture`
  String get RemoveProfilePicture {
    return Intl.message(
      'Remove Profile Picture',
      name: 'RemoveProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Gallery permission denied`
  String get Gallerypermissiondenied {
    return Intl.message(
      'Gallery permission denied',
      name: 'Gallerypermissiondenied',
      desc: '',
      args: [],
    );
  }

  /// `No image selected`
  String get Noimageselected {
    return Intl.message(
      'No image selected',
      name: 'Noimageselected',
      desc: '',
      args: [],
    );
  }

  /// `Image not found`
  String get Imagenotfound {
    return Intl.message(
      'Image not found',
      name: 'Imagenotfound',
      desc: '',
      args: [],
    );
  }

  /// `Camera permission denied`
  String get Camerapermissiondenied {
    return Intl.message(
      'Camera permission denied',
      name: 'Camerapermissiondenied',
      desc: '',
      args: [],
    );
  }

  /// `Tadweer        `
  String get AppName {
    return Intl.message('Tadweer        ', name: 'AppName', desc: '', args: []);
  }

  /// `LOGIN`
  String get LOGIN {
    return Intl.message('LOGIN', name: 'LOGIN', desc: '', args: []);
  }

  /// `Delete Task`
  String get deleteTask {
    return Intl.message('Delete Task', name: 'deleteTask', desc: '', args: []);
  }

  /// `Are you sure you want to delete this task?`
  String get Areyousureyouwanttodeletethistask {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'Areyousureyouwanttodeletethistask',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }
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

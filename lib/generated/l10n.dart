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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Test Management`
  String get title {
    return Intl.message(
      'Test Management',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Tests`
  String get upcomingTests {
    return Intl.message(
      'Upcoming Tests',
      name: 'upcomingTests',
      desc: '',
      args: [],
    );
  }

  /// `Completed Tests`
  String get completedTests {
    return Intl.message(
      'Completed Tests',
      name: 'completedTests',
      desc: '',
      args: [],
    );
  }

  /// `Select Class`
  String get selectClass {
    return Intl.message(
      'Select Class',
      name: 'selectClass',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get className {
    return Intl.message(
      'Class',
      name: 'className',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all tests?`
  String get deleteAllConfirmation {
    return Intl.message(
      'Are you sure you want to delete all tests?',
      name: 'deleteAllConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `This action cannot be undone.`
  String get deleteAllWarning {
    return Intl.message(
      'This action cannot be undone.',
      name: 'deleteAllWarning',
      desc: '',
      args: [],
    );
  }

  /// `Add Test`
  String get addTest {
    return Intl.message(
      'Add Test',
      name: 'addTest',
      desc: '',
      args: [],
    );
  }

  /// `Edit Test`
  String get editTest {
    return Intl.message(
      'Edit Test',
      name: 'editTest',
      desc: '',
      args: [],
    );
  }

  /// `Test Name`
  String get testName {
    return Intl.message(
      'Test Name',
      name: 'testName',
      desc: '',
      args: [],
    );
  }

  /// `Group Name`
  String get groupName {
    return Intl.message(
      'Group Name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Due Date`
  String get dueDate {
    return Intl.message(
      'Due Date',
      name: 'dueDate',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `This`
  String get thiss {
    return Intl.message(
      'This',
      name: 'thiss',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a test name`
  String get pleaseEnterTestName {
    return Intl.message(
      'Please enter a test name',
      name: 'pleaseEnterTestName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a group name`
  String get pleaseEnterGroupName {
    return Intl.message(
      'Please enter a group name',
      name: 'pleaseEnterGroupName',
      desc: '',
      args: [],
    );
  }

  /// `Update Test`
  String get updateTest {
    return Intl.message(
      'Update Test',
      name: 'updateTest',
      desc: '',
      args: [],
    );
  }

  /// `Delete Test`
  String get deleteTest {
    return Intl.message(
      'Delete Test',
      name: 'deleteTest',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this test?`
  String get areYouSureDelete {
    return Intl.message(
      'Are you sure you want to delete this test?',
      name: 'areYouSureDelete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Primary 1`
  String get primary1 {
    return Intl.message(
      'Primary 1',
      name: 'primary1',
      desc: '',
      args: [],
    );
  }

  /// `Primary 2`
  String get primary2 {
    return Intl.message(
      'Primary 2',
      name: 'primary2',
      desc: '',
      args: [],
    );
  }

  /// `Primary 3`
  String get primary3 {
    return Intl.message(
      'Primary 3',
      name: 'primary3',
      desc: '',
      args: [],
    );
  }

  /// `Primary 4`
  String get primary4 {
    return Intl.message(
      'Primary 4',
      name: 'primary4',
      desc: '',
      args: [],
    );
  }

  /// `Primary 5`
  String get primary5 {
    return Intl.message(
      'Primary 5',
      name: 'primary5',
      desc: '',
      args: [],
    );
  }

  /// `Primary 6`
  String get primary6 {
    return Intl.message(
      'Primary 6',
      name: 'primary6',
      desc: '',
      args: [],
    );
  }

  /// `Secondary 1`
  String get secondary1 {
    return Intl.message(
      'Secondary 1',
      name: 'secondary1',
      desc: '',
      args: [],
    );
  }

  /// `Secondary 2`
  String get secondary2 {
    return Intl.message(
      'Secondary 2',
      name: 'secondary2',
      desc: '',
      args: [],
    );
  }

  /// `Secondary 3`
  String get secondary3 {
    return Intl.message(
      'Secondary 3',
      name: 'secondary3',
      desc: '',
      args: [],
    );
  }

  /// `High School 1`
  String get highSchool1 {
    return Intl.message(
      'High School 1',
      name: 'highSchool1',
      desc: '',
      args: [],
    );
  }

  /// `High School 2`
  String get highSchool2 {
    return Intl.message(
      'High School 2',
      name: 'highSchool2',
      desc: '',
      args: [],
    );
  }

  /// `High School 3`
  String get highSchool3 {
    return Intl.message(
      'High School 3',
      name: 'highSchool3',
      desc: '',
      args: [],
    );
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

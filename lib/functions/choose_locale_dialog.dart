// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_planner/controller/cubit/locale_cubit.dart';

import 'local_manager.dart';

void showChooseLocaleDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const ChooseLocaleDialog();
    },
  );
}

class ChooseLocaleDialog extends StatefulWidget {
  const ChooseLocaleDialog({super.key});

  @override
  State<ChooseLocaleDialog> createState() => _ChooseLocaleDialogState();
}

class _ChooseLocaleDialogState extends State<ChooseLocaleDialog> {
  final String local = Intl.getCurrentLocale();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Arabic'),
            leading: Radio(
              value: 'ar',
              groupValue: local,
              onChanged: (value) {
                // Handle Arabic locale selection using shared preferences
                context.read<LocaleCubit>().setLocale(const Locale('ar'));
                LocaleManager.setLocale('ar').then((value) {
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
          ListTile(
            title: const Text('English'),
            leading: Radio(
              value: 'en',
              groupValue: local,
              onChanged: (value) {
                // Handle English locale selection
                context.read<LocaleCubit>().setLocale(const Locale('en'));
                LocaleManager.setLocale('en')
                    .then((value) => Navigator.of(context).pop());
              },
            ),
          ),
        ],
      ),
    );
  }
}

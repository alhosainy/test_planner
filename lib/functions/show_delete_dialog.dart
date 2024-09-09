import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/test_bloc/test_bloc.dart';
import '../generated/l10n.dart';
import '../models/test_model.dart';

void showDeleteConfirmationDialog(BuildContext context, Test test) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.current.deleteTest),
        content: Text(S.current.areYouSureDelete),
        actions: <Widget>[
          TextButton(
            child: Text(S.current.cancel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(S.current.delete),
            onPressed: () {
              context.read<TestBloc>().add(DeleteTest(test.id));
              Navigator.of(context).pop();
              Navigator.of(context).pop();
             
            },
          ),
        ],
      );
    },
  );
}

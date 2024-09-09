import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'controller/cubit/locale_cubit.dart';
import 'generated/l10n.dart';
import 'simple_bloc_observer.dart';
import 'views/test_management_view.dart';

import 'controller/test_bloc/test_bloc.dart';
import 'repo/test_repository.dart';

Future<void> main() async {
  final testRepository = TestRepository();
  await testRepository.initialize();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    BlocProvider(
      create: (context) =>
          TestBloc(testRepository: testRepository)..add(LoadTests()),
      child: BlocProvider(
        create: (context) => LocaleCubit()..getLocale(),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: state is LocaleLoaded ? state.locale : const Locale('ar'),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
                useMaterial3: true,
              ),
              home: const Scaffold(body: TestManagementPage()),
            );
          },
        ),
      ),
    ),
  );
}

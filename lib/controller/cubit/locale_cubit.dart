import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../functions/local_manager.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleInitial(Locale('ar')));
  Future<void> setLocale([Locale? locale]) async {
    if (locale == null) {
      final String? localeString = await LocaleManager.getLocaleString();
      if (localeString != null) {
        emit(LocaleLoaded(Locale(localeString)));
      }
    } else {
      await LocaleManager.setLocale(locale.languageCode);
      emit(LocaleLoaded(locale));
    }
  }

  Future<void> getLocale() async {
    final String? localeString = await LocaleManager.getLocaleString();
    if (localeString != null) {
      emit(LocaleLoaded(Locale(localeString)));
    } else {
      emit(const LocaleLoaded(Locale('ar')));
    }
  }
}

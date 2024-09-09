part of 'locale_cubit.dart';

sealed class LocaleState extends Equatable { 
  
  const LocaleState();

  @override
  List<Object> get props => [];
}

final class LocaleInitial extends LocaleState {
    final Locale locale;

  const LocaleInitial(this.locale);
}

final class LocaleLoaded extends LocaleState {
  final Locale locale;

  const LocaleLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

final class LocaleError extends LocaleState {
  final String message;

  const LocaleError(this.message);

  @override
  List<Object> get props => [message];
}

final class LocaleLoading extends LocaleState {}

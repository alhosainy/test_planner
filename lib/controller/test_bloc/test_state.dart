part of 'test_bloc.dart';

abstract class TestState extends Equatable {
  const TestState();
  
  @override
  List<Object> get props => [];
}

class TestsLoading extends TestState {}

class TestsLoaded extends TestState {
  final List<Test> tests;

  const TestsLoaded(this.tests);

  @override
  List<Object> get props => [tests];
}

class TestsError extends TestState {
  final String message;

  const TestsError(this.message);

  @override
  List<Object> get props => [message];
}
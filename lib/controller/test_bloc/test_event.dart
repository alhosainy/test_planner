part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class LoadTests extends TestEvent {}

class AddTest extends TestEvent {
  final Test test;

  const AddTest(this.test);

  @override
  List<Object> get props => [test];
}

class UpdateTest extends TestEvent {
  final Test test;

  const UpdateTest(this.test);

  @override
  List<Object> get props => [test];
}

class DeleteTest extends TestEvent {
  final String id;

  const DeleteTest(this.id);

  @override
  List<Object> get props => [id];
}

class ToggleCompleted extends TestEvent {
  final Test test;

  const ToggleCompleted(this.test);

  @override
  List<Object> get props => [test];
}

class DeleteAllTests extends TestEvent {}

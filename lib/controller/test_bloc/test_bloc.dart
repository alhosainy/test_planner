import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/test_model.dart';
import '../../repo/test_repository.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final TestRepository testRepository;

  TestBloc({required this.testRepository}) : super(TestsLoading()) {
    on<LoadTests>(_onLoadTests);
    on<AddTest>(_onAddTest);
    on<UpdateTest>(_onUpdateTest);
    on<DeleteTest>(_onDeleteTest);
    on<ToggleCompleted>(_onToggleCompleted);
    on<DeleteAllTests>(_onDeleteAllTests);
  }

  Future<void> _onLoadTests(LoadTests event, Emitter<TestState> emit) async {
    emit(TestsLoading());
    try {
      final tests = await testRepository.getAllTests();
      emit(TestsLoaded(tests));
    } catch (e) {
      emit(TestsError(e.toString()));
    }
  }

  Future<void> _onAddTest(AddTest event, Emitter<TestState> emit) async {
    final currentState = state;
    if (currentState is TestsLoaded) {
      try {
        await testRepository.addTest(event.test);
        final updatedTests = await testRepository.getAllTests();
        emit(TestsLoaded(updatedTests));
      } catch (e) {
        emit(TestsError(e.toString()));
      }
    }
  }

  Future<void> _onUpdateTest(UpdateTest event, Emitter<TestState> emit) async {
    final currentState = state;
    if (currentState is TestsLoaded) {
      try {
        await testRepository.updateTest(event.test);
        final updatedTests = await testRepository.getAllTests();
        emit(TestsLoaded(updatedTests));
      } catch (e) {
        emit(TestsError(e.toString()));
      }
    }
  }

  Future<void> _onDeleteTest(DeleteTest event, Emitter<TestState> emit) async {
    final currentState = state;
    if (currentState is TestsLoaded) {
      try {
        await testRepository.deleteTest(event.id);
        final updatedTests = await testRepository.getAllTests();
        emit(TestsLoaded(updatedTests));
      } catch (e) {
        emit(TestsError(e.toString()));
      }
    }
  }

  Future<void> _onToggleCompleted(
      ToggleCompleted event, Emitter<TestState> emit) async {
    final currentState = state;
    if (currentState is TestsLoaded) {
      emit(TestsLoading());
      try {
        await testRepository.toggleCompleted(event.test);
        final updatedTests = await testRepository.getAllTests();
        emit(TestsLoaded(updatedTests));
      } catch (e) {
        emit(TestsError(e.toString()));
      }
    }
  }

  Future<void> _onDeleteAllTests(
      DeleteAllTests event, Emitter<TestState> emit) async {
    emit(TestsLoading());
    try {
      await testRepository.clearAllTests();
      emit(const TestsLoaded([]));
    } catch (e) {
      emit(TestsError(e.toString()));
    }
  }
}

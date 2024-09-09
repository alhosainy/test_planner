import 'package:hive_flutter/hive_flutter.dart';
import '../log.dart';

import '../models/test_adaptor.dart';
import '../models/test_model.dart';

class TestRepository {
  static const String _boxName = 'tests';
  late Box<Test> _box;

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TestAdapter());
    _box = await Hive.openBox<Test>(_boxName);
  }

  Future<List<Test>> getAllTests() async {
    final tests = _box.values.toList();
    for (var test in tests) {
      Log.log('Test: ${test.isCompleted.toString()}');
    }
    return tests;
  }

  Future<void> addTest(Test test) async {
    await _box.put(test.id, test);
  }

  Future<void> updateTest(Test test) async {
    await _box.put(test.id, test);
  }

  Future<void> toggleCompleted(Test test) async {
    test.toggleCompleted();
    await _box.put(test.id, test);
  }

  Future<void> deleteTest(String id) async {
    await _box.delete(id);
  }

  Future<Test?> getTestById(String id) async {
    return _box.get(id);
  }

  Future<void> clearAllTests() async {
    await _box.clear();
  }
}

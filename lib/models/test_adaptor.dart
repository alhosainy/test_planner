import 'package:hive_flutter/hive_flutter.dart';

import 'test_model.dart';

part 'test_adaptor.g.dart';

@HiveType(typeId: 0)
class TestAdapter extends TypeAdapter<Test> {
  @override
  final typeId = 0;

  @override
  Test read(BinaryReader reader) {
    return Test(
      id: reader.read(),
      name: reader.read(),
      groupName: reader.read(),
      dueDate: reader.read(),
      className: reader.read(),
      isCompleted: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Test obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.groupName);
    writer.write(obj.dueDate);
    writer.write(obj.className);
    writer.write(obj.isCompleted);
  }
}
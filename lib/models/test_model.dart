import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Define the Test model as a Hive object
@HiveType(typeId: 0)
class Test extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String groupName;

  @HiveField(3)
  late DateTime dueDate;

  @HiveField(4)
  late String className;

  @HiveField(5)
  late bool isCompleted;

  Test({
    required this.id,
    required this.name,
    required this.groupName,
    required this.dueDate,
    required this.className,
    required this.isCompleted,
  });


  // Define a method to  toggle the isCompleted property.
  void toggleCompleted() {
    isCompleted = !isCompleted;
    save();

  }
}
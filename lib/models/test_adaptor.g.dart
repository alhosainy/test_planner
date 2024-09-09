// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_adaptor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestAdapterAdapter extends TypeAdapter<TestAdapter> {
  @override
  final int typeId = 0;

  @override
  TestAdapter read(BinaryReader reader) {
    return TestAdapter();
  }

  @override
  void write(BinaryWriter writer, TestAdapter obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

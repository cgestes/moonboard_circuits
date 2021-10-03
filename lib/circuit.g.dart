// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circuit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CircuitAdapter extends TypeAdapter<Circuit> {
  @override
  final int typeId = 0;

  @override
  Circuit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Circuit(
      boardVersion: fields[1] as String,
      circuit: (fields[3] as List).cast<int>(),
      name: fields[2] as String,
      uid: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Circuit obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.boardVersion)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.circuit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CircuitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

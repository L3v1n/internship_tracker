// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InternshipModelAdapter extends TypeAdapter<InternshipModel> {
  @override
  final int typeId = 0;

  @override
  InternshipModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InternshipModel(
      companyName: fields[0] as String,
      startDate: fields[1] as DateTime,
      requiredHours: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InternshipModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.requiredHours);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InternshipModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

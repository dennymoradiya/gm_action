// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_favarite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 0;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      name: fields[0] as String,
      website: fields[1] as String,
      icon: fields[2] as String,
      catname: fields[3] as String,
      rating: fields[4] as String,
      description: fields[5] as String,
      id: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.website)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.catname)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

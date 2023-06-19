// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trasaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrasactionModelAdapter extends TypeAdapter<TrasactionModel> {
  @override
  final int typeId = 0;

  @override
  TrasactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrasactionModel(
      category: fields[0] as String,
      price: fields[1] as double,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrasactionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrasactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

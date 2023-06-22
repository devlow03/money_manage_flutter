// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'negotiate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NegotiateAdapter extends TypeAdapter<Negotiate> {
  @override
  final int typeId = 1;

  @override
  Negotiate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Negotiate(
      category: fields[0] as String,
      price: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Negotiate obj) {
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
      other is NegotiateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infor_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformationUserHiveAdapter extends TypeAdapter<InformationUserHive> {
  @override
  final int typeId = 3;

  @override
  InformationUserHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InformationUserHive(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, InformationUserHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.user_id)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.fullname)
      ..writeByte(3)
      ..write(obj.full_address)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.avatar_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationUserHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

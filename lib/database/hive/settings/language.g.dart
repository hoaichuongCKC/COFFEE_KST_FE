// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguageHiveAdapter extends TypeAdapter<LanguageHive> {
  @override
  final int typeId = 2;

  @override
  LanguageHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguageHive(
      isLanguageVietNamese: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LanguageHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isLanguageVietNamese);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

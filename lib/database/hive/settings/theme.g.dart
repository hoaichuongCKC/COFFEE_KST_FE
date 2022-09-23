// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeHiveAdapter extends TypeAdapter<ThemeHive> {
  @override
  final int typeId = 1;

  @override
  ThemeHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeHive(
      isDarkTheme: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDarkTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

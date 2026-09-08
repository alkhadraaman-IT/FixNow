// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProviderModelAdapter extends TypeAdapter<ProviderModel> {
  @override
  final typeId = 0;

  @override
  ProviderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProviderModel(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      specialty: fields[2] as String?,
      experienceYears: (fields[3] as num?)?.toInt(),
      rating: (fields[4] as num?)?.toDouble(),
      reviewCount: (fields[5] as num?)?.toInt(),
      image: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProviderModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.specialty)
      ..writeByte(3)
      ..write(obj.experienceYears)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.reviewCount)
      ..writeByte(6)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProviderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Hospital',
      json,
      ($checkedConvert) {
        final val = Hospital(
          id: $checkedConvert('id', (v) => v as int?),
          user: $checkedConvert(
              'user',
              (v) =>
                  v == null ? null : User.fromJson(v as Map<String, dynamic>)),
          location: $checkedConvert('location', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'location': instance.location,
    };

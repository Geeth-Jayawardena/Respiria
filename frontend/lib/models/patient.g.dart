// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Patient',
      json,
      ($checkedConvert) {
        final val = Patient(
          id: $checkedConvert('id', (v) => v as int?),
          user: $checkedConvert(
              'user',
              (v) =>
                  v == null ? null : User.fromJson(v as Map<String, dynamic>)),
          hospital: $checkedConvert(
              'hospital',
              (v) => v == null
                  ? null
                  : Hospital.fromJson(v as Map<String, dynamic>)),
          nic: $checkedConvert('nic', (v) => v as String?),
          dob: $checkedConvert(
              'dob', (v) => v == null ? null : DateTime.parse(v as String)),
          isDeathApproved:
              $checkedConvert('is_death_approved', (v) => v as bool?),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'isDeathApproved': 'is_death_approved'},
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'hospital': instance.hospital?.toJson(),
      'nic': instance.nic,
      'dob': instance.dob?.toIso8601String(),
      'is_death_approved': instance.isDeathApproved,
      'status': instance.status,
    };

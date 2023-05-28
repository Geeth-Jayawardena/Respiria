// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          id: $checkedConvert('id', (v) => v as int?),
          username: $checkedConvert('username', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          contactNumber: $checkedConvert('contact_number', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'contactNumber': 'contact_number'},
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'contact_number': instance.contactNumber,
      'role': instance.role,
    };

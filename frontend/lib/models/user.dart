import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
  checked: true,
  disallowUnrecognizedKeys: false,
  fieldRename: FieldRename.snake,
)
class User extends Equatable {
  const User({
    this.id,
    this.username,
    this.name,
    this.contactNumber,
    this.role,
  });

  final int? id;
  final String? username;
  final String? name;
  final String? contactNumber;
  final String? role;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        username,
        name,
        contactNumber,
        role,
      ];
}

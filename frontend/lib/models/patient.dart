import 'package:resperia/models/hospital.dart';
import 'package:resperia/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable(
  explicitToJson: true,
  checked: true,
  disallowUnrecognizedKeys: false,
  fieldRename: FieldRename.snake,
)
class Patient extends Equatable {
  const Patient({
    this.id,
    this.user,
    this.hospital,
    this.nic,
    this.dob,
    this.isDeathApproved,
    this.status,
  });

  final int? id;
  final User? user;
  final Hospital? hospital;
  final String? nic;
  final DateTime? dob;
  final bool? isDeathApproved;
  final String? status;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  @override
  List<Object?> get props => [
        id,
        user,
        hospital,
        nic,
        dob,
        isDeathApproved,
        status,
      ];
}

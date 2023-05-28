import 'package:resperia/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable(
  explicitToJson: true,
  checked: true,
  disallowUnrecognizedKeys: false,
  fieldRename: FieldRename.snake,
)
class Hospital extends Equatable {
  const Hospital({
    this.id,
    this.user,
    this.location,
  });

  final int? id;
  final User? user;
  final String? location;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalToJson(this);

  @override
  List<Object?> get props => [
        id,
        user,
        location,
      ];
}

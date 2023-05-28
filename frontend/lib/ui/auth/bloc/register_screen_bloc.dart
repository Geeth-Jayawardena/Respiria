import 'package:resperia/main.dart';
import 'package:resperia/models/hospital.dart';
import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:resperia/repositories/auth_repository.dart';
import 'package:resperia/service_locator.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreenBloc extends FormBloc<dynamic, String> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  final name = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
  ]);

  final email = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email,
  ]);

  final phone = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
    _enforceLength,
  ]);

  final nicNumber = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
  ]);

  final dob = InputFieldBloc<DateTime?, dynamic>(initialValue: null);

  final address = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
  ]);

  final password = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
    _min8Chars,
  ]);

  final confirmPassword = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
  ]);


  final InputFieldBloc<XFile?, Object> nicFront =
      InputFieldBloc(initialValue: null);

  final InputFieldBloc<XFile?, Object> nicBack =
      InputFieldBloc(initialValue: null);

  final hospital = SelectFieldBloc<Hospital, dynamic>(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  RegisterScreenBloc() : super(isLoading: true) {
    addFieldBlocs(fieldBlocs: [
      email,
      phone,
      name,
      password,
      confirmPassword,
      nicNumber,
      dob,
      address,
      hospital,
    ]);

    confirmPassword
      ..addValidators([FieldBlocValidators.confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  static String? _min8Chars(String? str) {
    if (str != null) {
      return str.length < 8 ? "Must have at least 8 characters." : null;
    } else {
      return null;
    }
  }

  static String? _enforceLength(String? str) {
    if (str != null) {
      return str.length != 10 ? "Enter valid phone number" : null;
    } else {
      return null;
    }
  }

  @override
  void onLoading() async {
    try {
      Response response = await _authRepository.getHospitals();

      if (response.statusCode == 200) {
        List<Hospital> hospitalList =
            (response.data as List).map((e) => Hospital.fromJson(e)).toList();

        hospital.updateItems(hospitalList);

        emitLoaded();
      } else {
        emitLoadFailed(failureResponse: "Error Loading Data");
      }
    } catch (e) {
      logger.e(e);
      emitLoadFailed(failureResponse: "Error Loading Data");
    }
  }

  @override
  void onSubmitting() async {
    try {
      Response response = await _authRepository.register(
        username: email.value,
        contactNumber: phone.value,
        name: name.value,
        nic: nicNumber.value,
        dob: dob.value!,
        address: address.value,
        password: password.value,
        hospitalId: hospital.value!.id!,
      );

      if (response.statusCode == 200) {
        emitSuccess();
      } else {
        emitFailure(failureResponse: "Error Register");
      }
    } catch (e) {
      logger.e(e);
      emitFailure(failureResponse: "Error Register");
    }
  }
}

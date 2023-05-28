import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:resperia/main.dart';
import 'package:resperia/repositories/auth_repository.dart';
import 'package:resperia/service_locator.dart';

class LoginScreenBloc extends FormBloc<dynamic, String> {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  final email = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
    FieldBlocValidators.email,
  ]);

  final password = TextFieldBloc<dynamic>(validators: [
    FieldBlocValidators.required,
    _min8Chars,
  ]);

  LoginScreenBloc() {
    addFieldBlocs(fieldBlocs: [
      email,
      password,
    ]);
  }

  static String? _min8Chars(String? str) {
    if (str != null) {
      return str.length < 8 ? "Must have at least 8 characters." : null;
    } else {
      return null;
    }
  }

  @override
  void onSubmitting() async {
    try {
      Response response = await _authRepository.login(
        email: email.value,
        password: password.value,
      );

      if (response.statusCode == 200) {
        await _authRepository.saveToken(response.data["token"]);
        emitSuccess();
      } else {
        emitFailure(failureResponse: "Error Login");
      }
    } catch (e) {
      logger.e(e);
      emitFailure(failureResponse: "Error Login");
    }
  }
}

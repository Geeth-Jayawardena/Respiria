import 'package:resperia/main.dart';
import 'package:resperia/models/patient.dart';
import 'package:resperia/repositories/auth_repository.dart';
import 'package:resperia/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  String _userStatus = "";
  var _loading = false;

  String get getUserStatus {
    return _userStatus;
  }

  bool get getLoading {
    return _loading;
  }

  void getState() async {
    _loading = true;
    notifyListeners();

    try {
      Response response = await getIt<AuthRepository>().getUser();

      if (response.statusCode == 200) {
        Patient patient = Patient.fromJson(response.data);

        _userStatus = patient.status ?? "";
        _loading = false;
        notifyListeners();
      } else {}
    } catch (e) {
      logger.e(e);
      _loading = true;
      notifyListeners();
    }
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:resperia/api/dio_client.dart';
import 'package:resperia/service_locator.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepository {
  final DioClient _dioClient = getIt<DioClient>();

  Future<Response> getUser() async {
    Dio dio = await _dioClient.initializeWithKey();
    return await dio.get<dynamic>('/auth/user');
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    Dio dio = await _dioClient.initializeWithoutKey();
    return await dio.post<dynamic>(
      '/auth/login',
      data: jsonEncode({
        "type": "PATIENT",
        "email": email,
        "password": password,
      }),
    );
  }

  Future<Response> register({
    required String username,
    required String name,
    required String contactNumber,
    required String nic,
    required DateTime dob,
    required String address,
    required String password,
    required int hospitalId,
  }) async {
    Map<String, dynamic> map = <String, dynamic>{};

    map['type'] = "PATIENT";
    map['username'] = username;
    map['password'] = password;
    map['name'] = name;
    map['contact_number'] = contactNumber;
    map['nic'] = nic;
    map['dob'] = dob;
    map['address'] = address;
    map['hospital_id'] = hospitalId;

    Dio dio = await _dioClient.initializeWithoutKeyForm();

    return await dio.post<dynamic>(
      '/auth/register',
      data: FormData.fromMap(map),
      onSendProgress: (int sent, int total) {},
    );
  }

  Future<void> saveToken(String token) async {
    const storage = FlutterSecureStorage();

    await storage.write(key: 'auth_key', value: token);
  }

  Future<void> deleteToken() async {
    const storage = FlutterSecureStorage();

    await storage.delete(key: 'auth_key');
  }

  Future<Response> getHospitals() async {
    Dio dio = await _dioClient.initializeWithoutKey();
    return await dio.get<dynamic>('/auth/hospital/');
  }

  Future<Response> predict({
    required XFile image,
  }) async {
    Map<String, dynamic> map = <String, dynamic>{};

    map['image'] = await MultipartFile.fromFile(image.path);

    Dio dio = await _dioClient.initializeWithKey();

    return await dio.post<dynamic>(
      '/acne_prediction',
      data: FormData.fromMap(map),
      onSendProgress: (int sent, int total) {},
    );
  }
}

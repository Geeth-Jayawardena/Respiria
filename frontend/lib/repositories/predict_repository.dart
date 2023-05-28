import 'dart:io';

import 'package:dio/dio.dart';
import 'package:resperia/api/dio_client.dart';
import 'package:resperia/service_locator.dart';

class PredictionRepository {
  final DioClient _dioClient = getIt<DioClient>();

  Future<Response> getPrediction({
    required File file,
  }) async {
    Map<String, dynamic> map = <String, dynamic>{};

    map['file'] = await MultipartFile.fromFile(file.path);

    Dio dio = await _dioClient.initializeWithKey();

    return await dio.post<dynamic>(
      '/prediction',
      data: FormData.fromMap(map),
      onSendProgress: (int sent, int total) {},
    );
  }
}

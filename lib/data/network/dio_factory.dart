// ignore_for_file: constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:udemy_mvvc_course/app/constants.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeOut = 60 * 1000;
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Constant.token,
      DEFAULT_LANGUAGE: "en", // todo: get language from app prefs
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: headers,
    );
    return dio;
  }
}

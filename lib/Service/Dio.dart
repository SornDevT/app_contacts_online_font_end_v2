import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  // dio.options.baseUrl = "http://10.0.2.2:8000/api";
  dio.options.baseUrl = "https://app.contact.online2.sdtapp.xyz/api";
  dio.options.headers['accept'] = 'Application/json';
  return dio;
}

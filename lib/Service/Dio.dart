import 'package:dio/dio.dart';

dio() {
  Dio dio = new Dio();

  dio.options.baseUrl = "http;//10.2.0.0:8000/api";
  dio.options.headers['accept'] = 'Application/json';
}

import 'package:dio/dio.dart';

class RestClient {
  static const BASE_URL = "https://60bb07af42e1d00017620380.mockapi.io/";
  static const CONTENT_TYPE = "application/json; charset=utf-8";
  static const CONNECTION_TIME_OUT = 5000;
  static const RECIVE_TIME_OUT = 1000;

  final BaseOptions options = new BaseOptions(
    baseUrl: BASE_URL,
    contentType: CONTENT_TYPE,
    connectTimeout: CONNECTION_TIME_OUT,
    receiveTimeout: RECIVE_TIME_OUT,
  );
}

RestClient restClient = new RestClient();

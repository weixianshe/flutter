import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: 'http://iwenwiki.com:3000',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio https = Dio(options);

class Http {
  final Dio dio = Dio();
}

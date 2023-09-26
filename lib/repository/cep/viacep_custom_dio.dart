import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ViaCepCustomDio {
  final _dio = Dio();

  ViaCepCustomDio() {
    _dio.options.baseUrl = dotenv.get('VIACEP_BASEURL');
  }

  Dio get dio => _dio;
}

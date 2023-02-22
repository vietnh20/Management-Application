import 'package:final_nguyenhoangviet/model/login_info.dart';
import 'package:final_nguyenhoangviet/api/api.dart';
import 'package:final_nguyenhoangviet/api/api_interceptor.dart';
import 'package:dio/dio.dart';

class AppVariables {
  static LoginInfo? userInfo;
  static late ApiClient api;

  static void init() {
    final dio = Dio();
    dio.options.contentType = 'application/json;charset=utf-8';
    dio.interceptors.add(ApiInterceptor());
    api = ApiClient(dio);
  }
}

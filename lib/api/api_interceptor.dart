import 'package:dio/dio.dart';
import 'package:final_nguyenhoangviet/utils/app_variables.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (AppVariables.userInfo != null) {
      options.headers['Authorization'] =
          'Bearer ${AppVariables.userInfo!.token}';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }
}

import 'package:final_nguyenhoangviet/model/base_result.dart';
import 'package:final_nguyenhoangviet/model/login_info.dart';
import 'package:final_nguyenhoangviet/model/login_request.dart';
import 'package:final_nguyenhoangviet/model/task.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://restfulapi.dnd-group.net/api/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/tasks')
  Future<BaseResult<List<Task>>> getTasks();
  @GET('/tasks/{id}')
  Future<BaseResult<Task>> getTask(@Path() int id);
  @POST('/tasks')
  Future<BaseResult<Task>> addTasks(@Body() Task task);
  @PUT('/tasks/{id}')
  Future<BaseResult<Task>> updateTasks(@Path() int id, @Body() Task task);
  @DELETE('/tasks/{id}')
  Future<BaseResult> deleteTasks(@Path() int id);

  @POST('/login')
  Future<BaseResult<LoginInfo>> login(@Body() LoginRequest req);
}

import 'package:final_nguyenhoangviet/utils/app_variables.dart';
import 'package:final_nguyenhoangviet/model/login_info.dart';
import 'package:final_nguyenhoangviet/model/login_request.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginViewModel extends Model {
  Future<LoginInfo?> login(String username, String password) async {
    var result = await AppVariables.api.login(LoginRequest(username, password));
    if (result.errorCode == 0) {
      return result.data;
    }
    return null;
  }
}

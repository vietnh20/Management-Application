import 'package:final_nguyenhoangviet/ui/login/login_view_model.dart';
import 'package:final_nguyenhoangviet/ui/login/task/task_screen.dart';
import 'package:final_nguyenhoangviet/utils/app_variables.dart';
import 'package:final_nguyenhoangviet/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});

  @override
  // State<LoginScreen> createState() => _LoginScreenState();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final loginViewModel = LoginViewModel();

    void loginAction(var context, LoginViewModel model) async {
      _formKey.currentState!.save();
      if (_formKey.currentState!.validate()) {
        var formValue = _formKey.currentState!.value;
        final username = formValue['username'].toString();
        final password = formValue['password'].toString();
        final result = await model.login(username, password);
        if (result != null) {
          AppVariables.userInfo = result;
          Prefs.setUsername(username);
          Prefs.setPassword(password);

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TaskScreen()),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Wrong username or password!')));
        }
      }
    }

    return ScopedModel(
        model: loginViewModel,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'username',
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username'),
                            validator: FormBuilderValidators.required(),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'password',
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password'),
                            validator: FormBuilderValidators.required(),
                            keyboardType: TextInputType.text,
                          ),
                          ElevatedButton(
                              onPressed: () =>
                                  loginAction(context, loginViewModel),
                              child: Text('Login'))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}

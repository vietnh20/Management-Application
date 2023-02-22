import 'package:final_nguyenhoangviet/ui/login/task/task_screen.dart';
import 'package:final_nguyenhoangviet/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _settingScreenState();
}

class _settingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _formKey = GlobalKey<FormBuilderState>();

    void customizeAccount(var context) {
      _formKey.currentState!.save();
      if (_formKey.currentState!.validate()) {
        final formValue = _formKey.currentState!.value;
        if (Prefs.username.isNotEmpty && Prefs.password.isNotEmpty) {
          Prefs.setUsername(formValue['username']);
          Prefs.setPassword(formValue['password']);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Changed Successfully')));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TaskScreen()),
              (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Validate Failed!')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.lightBlue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              child: Column(
                children: const [
                  Icon(
                    Icons.account_circle,
                    size: 70,
                    color: Colors.grey,
                  ),
                  Text(
                    'Task Management',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people_rounded),
              title: const Text('Tasks'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.lightBlue)),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'username',
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(70)
                            ]),
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'password',
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(8)
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue),
                    onPressed: () => customizeAccount(context),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

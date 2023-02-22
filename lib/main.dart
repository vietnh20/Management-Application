import 'package:final_nguyenhoangviet/ui/login/login_screen.dart';
import 'package:final_nguyenhoangviet/ui/login/task/task_screen.dart';
import 'package:final_nguyenhoangviet/utils/app_variables.dart';
import 'package:final_nguyenhoangviet/utils/prefs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Prefs.init();
    AppVariables.init();
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   FormBuilderLocalizations.delegate
      // ],
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Task Management')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Text(
                'Task',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Tasks'),
              onTap: () {
                MaterialPageRoute(builder: ((context) => TaskScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:final_nguyenhoangviet/ui/login/task/task_screen.dart';
import 'package:final_nguyenhoangviet/utils/setting_screen.dart';
import 'package:flutter/material.dart';

class TaskDrawer extends StatefulWidget {
  const TaskDrawer({super.key});

  @override
  State<TaskDrawer> createState() => _TaskDrawerState();
}

class _TaskDrawerState extends State<TaskDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 46.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Task Management',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Tasks'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TaskScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
          ),
        ],
      ),
    );
  }
}

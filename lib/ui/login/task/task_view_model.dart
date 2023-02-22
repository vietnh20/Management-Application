import 'package:final_nguyenhoangviet/utils/app_variables.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:final_nguyenhoangviet/model/task.dart';

class TaskViewModel extends Model {
  static final TaskViewModel _instance = TaskViewModel._internal();
  factory TaskViewModel() => _instance;
  TaskViewModel._internal() {
    updateList();
  }

  List<Task> tasks = [];

  void updateList() async {
    final results = await AppVariables.api.getTasks();
    tasks = results.data ?? [];
    notifyListeners();
  }

  void save(Task task) async {
    task.id == 0
        ? await AppVariables.api.addTasks(task)
        : await AppVariables.api.updateTasks(task.id, task);
    updateList();
  }

  void delete(Task task) async {
    await AppVariables.api.deleteTasks(task.id);
    updateList();
  }
}

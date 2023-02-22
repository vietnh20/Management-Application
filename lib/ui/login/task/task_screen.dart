import 'package:final_nguyenhoangviet/drawer.dart';
import 'package:final_nguyenhoangviet/model/task.dart';
import 'package:final_nguyenhoangviet/ui/login/task/task_item.dart';
import 'package:final_nguyenhoangviet/ui/login/task/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:scoped_model/scoped_model.dart';

class TaskScreen extends StatelessWidget {
  // const TaskScreen({super.key});

  @override
  // State<StatefulWidget> createState() => _taskScreenState();
  @override
  Widget build(BuildContext context) {
    final taskViewModel = TaskViewModel();
    return ScopedModel(
        model: taskViewModel,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Task'),
            actions: [
              IconButton(
                  onPressed: () => showEditDialog(context, taskViewModel),
                  icon: const Icon(Icons.add))
            ],
          ),
          drawer: TaskDrawer(),
          body: listTasks(),
        ));
  }

  Widget listTasks() => ScopedModelDescendant<TaskViewModel>(
          builder: (BuildContext context, Widget? child, TaskViewModel model) {
        return ListView.builder(
            itemCount: model.tasks.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: model.tasks[index],
                onClick: (task) {
                  // call showEditDialog
                  showEditDialog(context, model, task: task);
                },
                onDelete: (task) {
                  model.delete(task);
                },
              );
            });
      });
  final taskNameController = TextEditingController();
  Future<void> showDeleteDialog(BuildContext context, {Task? task}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    TaskViewModel().delete(task!);
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('NO'))
            ],
          );
        });
  }

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> showEditDialog(BuildContext context, TaskViewModel taskViewModel,
      {Task? task}) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('New Task'),
            content: SingleChildScrollView(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FormBuilderTextField(
                      name: 'title',
                      initialValue: task?.title,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Title'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      name: 'assignee',
                      initialValue: task?.assignee,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Assignee'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderDateTimePicker(
                      name: 'startDate',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: task?.startDate,
                      inputType: InputType.both,
                      decoration: InputDecoration(
                        labelText: 'Start Date',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date']
                                ?.didChange(null);
                          },
                        ),
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderDateTimePicker(
                      name: 'endDate',
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialValue: task?.endDate,
                      inputType: InputType.both,
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _formKey.currentState!.fields['date']
                                ?.didChange(null);
                          },
                        ),
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      // locale: const Locale.fromSubtags(languageCode: 'fr'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderRadioGroup<String>(
                      decoration: const InputDecoration(
                        labelText: 'Status',
                      ),
                      initialValue: task?.status,
                      name: 'status',
                      // onChanged: _onChanged,
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      options: ['NEW', 'ON PROGRESS', 'DONE']
                          .map((task) => FormBuilderFieldOption(
                                value: task,
                                child: Text(task),
                              ))
                          .toList(growable: false),
                      controlAffinity: ControlAffinity.trailing,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _formKey.currentState!.save();
                    print(_formKey.currentState!.value);

                    final formValue = _formKey.currentState!.value;

                    final task1 = Task(
                        title: formValue['title'].toString(),
                        assignee: formValue['assignee'].toString(),
                        startDate: formValue['startDate'],
                        endDate: formValue['endDate'],
                        status: formValue['status'].toString());
                    print('Task Information Saved!!!');

                    if (task != null) {
                      task1.id = task.id;
                    }

                    TaskViewModel().save(task1);
                  },
                  child: const Text('Save')),
            ],
          );
        });
  }
}

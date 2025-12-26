import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovage/features/task_management/presentation/riverpod/task_provider.dart';
import 'package:innovage/features/task_management/presentation/riverpod/task_states.dart';
import 'package:innovage/features/task_management/utils/constants/app_strings.dart';

import '../../data/models/task_model.dart';

class AddEditTask extends StatefulWidget {
  const AddEditTask({super.key});

  @override
  State<AddEditTask> createState() => _AddEditTaskState();
}

class _AddEditTaskState extends State<AddEditTask> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  TaskModel? _arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newArguments = ModalRoute.of(context)?.settings.arguments as TaskModel?;
    if (newArguments != _arguments) {
      _arguments = newArguments;
      _nameController.text = _arguments?.name ?? '';
      _dateController.text = _arguments?.date ?? '';
      _idController.text = _arguments?.id ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = _arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments == null ? AppStrings.add : AppStrings.edit),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(hintText: AppStrings.num),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: AppStrings.name),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                hintText: AppStrings.date,
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                final now = DateTime.now();
                final tomorrow = now.add(const Duration(days: 1));
                DateTime initialDate = tomorrow;

                if (_dateController.text.isNotEmpty) {
                  try {
                    final selectedDate = DateTime.parse(_dateController.text);
                    if (selectedDate.isAfter(now)) {
                      initialDate = selectedDate;
                    }
                  } catch (e) {
                    // Invalid date format, use default initial date
                  }
                }

                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: initialDate,
                  firstDate: tomorrow,
                  lastDate: DateTime(2101),
                );

                if (pickedDate != null) {
                  setState(() {
                    _dateController.text =
                        pickedDate.toIso8601String().split('T').first;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                TasksState state = ref.watch(taskNotifierProvider);
                return state is TasksLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          if (arguments == null) {
                            ref.read(taskNotifierProvider.notifier).addTask(
                                TaskModel(
                                    id: _idController.text,
                                    name: _nameController.text,
                                    date: _dateController.text));
                          } else {
                            ref.read(taskNotifierProvider.notifier).editTask(
                                TaskModel(
                                  id: _idController.text,
                                  name: _nameController.text,
                                  date: _dateController.text,
                                ),
                                arguments.id);
                          }
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child: Text(arguments == null
                                  ? AppStrings.add
                                  : AppStrings.edit)),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

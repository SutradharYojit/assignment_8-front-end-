import 'dart:developer';
import 'package:assignment_8/services/services.dart';
import 'package:flutter/material.dart';
import '../../widget/widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home/task_list_provider.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key, this.data});

  final UpdateData? data;

  @override
  ConsumerState<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  void onPressed(BuildContext context) async {
    if (_titleCtrl.text.trim() == "" ||
        _titleCtrl.text.trim().isEmpty ||
        _descriptionCtrl.text.trim() == "" ||
        _descriptionCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Required all filled"),
        ),
      );
    } else if (widget.data?.homeScreen ?? false) {
      log("inside");
      log(widget.data!.id.toString());
      ref.read(todoList.notifier).updateTask(index: widget.data!.index!, body: {
        "email": UserPreferences.email,
        "id": widget.data!.id!,
        "title": _titleCtrl.text.trim(),
        "description": _descriptionCtrl.text.trim()
      }   );
      _titleCtrl.clear();
      _descriptionCtrl.clear();
      Navigator.pop(context);
    } else {
      ref.read(todoList.notifier).addTak({
        "email": UserPreferences.email,
        "title": _titleCtrl.text.trim(),
        "description": _descriptionCtrl.text.trim()
      });
      _titleCtrl.clear();
      _descriptionCtrl.clear();
      Navigator.pop(context);
    }
  }

  void update() {
    if (widget.data?.homeScreen ?? false) {
      _titleCtrl.text = widget.data!.title!;
      _descriptionCtrl.text = widget.data!.description!;
    }
  }

  @override
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: widget.data?.homeScreen ?? false ? const Text("Update Todo") : const Text("Add Todo"),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  PrimaryTextFilled(
                    controller: _titleCtrl,
                    hintText: "Title",
                    labelText: "Title",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryTextFilled(
                    controller: _descriptionCtrl,
                    hintText: "Write description",
                    labelText: "Description",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onPressed(context);
                      },
                      child: const Text("Submit"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateData {
  final int? index;
  final String? id;
  final String? title;
  final String? description;
  final bool? homeScreen;

  UpdateData({
    this.id,
    this.index,
    this.title,
    this.description,
    this.homeScreen,
  });
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';
import '../../services/services.dart';

final todoList = StateNotifierProvider<TodoDataList, List<TaskModel>>((ref) => TodoDataList());

class TodoDataList extends StateNotifier<List<TaskModel>> {
  TodoDataList() : super([]);

  bool loading = true;
  final auth = FirebaseAuth.instance.currentUser?.email;
  final db = FirebaseFirestore.instance;

  Future<void> fetchTodoList(String userEmail) async {
    state.clear();
    var data = await ApiServices().taskData(api: "${APIConstants.baseUrl}createTask/getAll/$userEmail");
    for (Map<String, dynamic> i in data) {
      //add all the data to blogData List
      state.add(TaskModel.fromJson(i));
    }
    loading = false;
    log(state[0].title.toString());
    state = [...state];
  }

  Future<void> remove(TaskModel delete, Map<String, dynamic> body) async {
    await ApiServices().deleteTask(api: "${APIConstants.baseUrl}createTask/delete", data: body);
    state.remove(delete);
    state = [...state];
  }

  Future<void> addTak(Map<String, dynamic> body) async {
    await ApiServices().postApi(api: "${APIConstants.baseUrl}createTask/addTask", data: body).then((value) {
      state.insert(
        0,
        TaskModel(
          id: value["taskId"],
          title: body["title"],
          description: body["description"],
        ),
      );
      state = [...state];
    });
  }

  Future<void> updateTask({required int index, required Map<String, dynamic> body}) async{
    await ApiServices().postApi(api: "${APIConstants.baseUrl}createTask/update", data: body).then((value) {
      state[index].title = body["title"];
      state[index].description = body["description"];

      log(state.length.toString());
      state = [...state];
    });

  }
}

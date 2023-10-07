import 'package:assignment_8/services/services.dart';
import 'package:assignment_8/view/home/task_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widget/widget.dart';
import '../view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(todoList.notifier).fetchTodoList(UserPreferences.email!);
  }

  @override
  Widget build(BuildContext context) {
    final listData = ref.watch(todoList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Todo App"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const AddTaskScreen();
                },
              );
            },
            icon: Icon(
              Icons.add,
              size: 28.h,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (direction) async {},
                      key: UniqueKey(),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return   AddTaskScreen(
                                data: UpdateData(
                                  index: index,
                                  id: listData[index].id!,
                                  title: listData[index].title!,
                                  description: listData[index].description!,
                                  homeScreen: true
                                ),
                              );
                            },
                          );
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 270,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextRich(firstText: "Title\t:", secText: listData[index].title!),
                                      TextRich(firstText: "Description\t:", secText: listData[index].description!),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        ref.read(todoList.notifier).remove(
                                          listData[index],
                                          {
                                            "email": UserPreferences.email,
                                            "id": listData[index].id,
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.delete_outline_rounded),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

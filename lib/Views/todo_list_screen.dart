import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo/Models/TodoListModel.dart';
import 'package:todo/Services/todo_service.dart';
import 'package:todo/Views/add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    TodoService.getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<TodoListModel>(
              future: TodoService.getTodoList(),
              builder: (context, AsyncSnapshot<TodoListModel> snapshot) {
                if (!snapshot.hasData) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.pink.shade300,
                    child: ListView.builder(
                        itemCount: 7,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                                leading: const CircleAvatar(
                                    foregroundColor: Colors.white,
                                    child: Text(" ")),
                                title: Container(
                                  color: Colors.white,
                                  height: 10,
                                ),
                                subtitle: Container(
                                  color: Colors.white,
                                  height: 10,
                                ),
                                trailing: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          );
                        }),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await TodoService.getTodoList();
                      setState(() {});
                    },
                    child: ListView.builder(
                        itemCount: snapshot.data?.meta!.totalItems?.toInt(),
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text(
                                  "${i + 1}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                  snapshot.data!.items![i].title.toString()),
                              subtitle: Text(snapshot
                                  .data!.items![i].description
                                  .toString()),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_vert_outlined),
                                onPressed: () {},
                              ),
                            ),
                          );
                        }),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddScreen();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void navigateToAddScreen() {
    final route =
        MaterialPageRoute(builder: (context) => const AddTodoScreen());
    Navigator.push(context, route);
  }
}

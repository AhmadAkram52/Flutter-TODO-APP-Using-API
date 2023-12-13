import 'package:flutter/material.dart';
import 'package:todo/Models/GetListModel.dart';
import 'package:todo/Services/service.dart';
import 'package:todo/Utils/navigators.dart';
import 'package:todo/Views/add_todo_screen.dart';
import 'package:todo/Views/my_shimmer.dart';

//
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool isVisible = true;
  String? id, title, des;

  @override
  void initState() {
    super.initState();
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
              future: TService.getTodoList(),
              builder: (context, AsyncSnapshot<TodoListModel> snapshot) {
                if (!snapshot.hasData) {
                  return TShimmer.listShimmer();
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await TService.getTodoList();
                      setState(() {});
                    },
                    child: ListView.builder(
                        itemCount: snapshot.data!.meta!.totalItems?.toInt(),
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                id = snapshot.data!.items![i].id;
                                title = snapshot.data!.items![i].title;
                                des = snapshot.data!.items![i].description;
                                TNavigators.navigateToCompleteView(
                                    title: title.toString(),
                                    context: context,
                                    description: des.toString());
                              },
                              child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      "${i + 1}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  title: Text(snapshot.data!.items![i].title
                                      .toString()),
                                  subtitle: Text(
                                      snapshot.data!.items![i].description!
                                          .replaceAll('\n', " ")
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: TextDirection.ltr),
                                  trailing: PopupMenuButton(
                                    onSelected: (v) {
                                      id = snapshot.data!.items![i].id;
                                      title = snapshot.data!.items![i].title;
                                      des =
                                          snapshot.data!.items![i].description;
                                      if (v == "Edit") {
                                        navigateToEditPage(
                                          title: title.toString(),
                                          id: id.toString(),
                                          description: des.toString(),
                                        );
                                      } else if (v == 'Delete') {
                                        showDeleteDialog(
                                            context: context,
                                            title: title.toString(),
                                            id: id.toString());
                                      }
                                    },
                                    itemBuilder: (context) {
                                      return [
                                        const PopupMenuItem(
                                          value: "Edit",
                                          child: Center(child: Text("Edit")),
                                        ),
                                        const PopupMenuItem(
                                          value: "Delete",
                                          child: Center(child: Text("Delete")),
                                        ),
                                      ];
                                    },
                                  )),
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

  Future<dynamic> showDeleteDialog(
      {required BuildContext context,
      required String title,
      required String id}) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        elevation: 50,
        actions: [
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              TService.deleteById(id: id);
              Navigator.pop(context);
              setState(() {});
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ],
        title: Text("Are You Sure To Delete $title"),
      ),
    );
  }

  Future<void> navigateToAddScreen() async {
    final route =
        MaterialPageRoute(builder: (context) => const AddTodoScreen());
    final reload = await Navigator.push(context, route);
    if (reload) {
      setState(() {});
    }
  }

  Future<void> navigateToEditPage(
      {required String id,
      required String title,
      required String description}) async {
    final route = MaterialPageRoute(
        builder: (context) => AddTodoScreen(
              id: id,
              isEdit: true,
              title: title,
              description: description,
            ));
    final reload = await Navigator.push(context, route);
    if (reload) {
      setState(() {});
    }
  }
}

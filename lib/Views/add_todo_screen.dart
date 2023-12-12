import 'package:flutter/material.dart';
import 'package:todo/Services/todo_service.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  String titleError = "";
  String desError = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Title",
                    errorText: titleError.isEmpty ? null : titleError),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: desController,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                decoration: InputDecoration(
                    hintText: "Description",
                    errorText: desError.isEmpty ? null : desError),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  submitToServer();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void submitToServer() {
    final String title = titleController.text.toString();
    final String description = desController.text.toString();
    if (title.isEmpty && description.isEmpty) {
      titleError = "Fill This Field";
      desError = "Fill This Field";
      setState(() {});
    } else if (title.isEmpty) {
      titleError = "Fill This Field";
      setState(() {});
    } else if (description.isEmpty) {
      desError = "Fill This Field";
      setState(() {});
    } else {
      TodoService.postTodoList(
          title: title, description: description, context: context);
    }
  }
}

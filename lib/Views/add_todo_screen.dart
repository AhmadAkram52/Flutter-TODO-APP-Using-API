import 'package:flutter/material.dart';
import 'package:todo/Services/service.dart';

class AddTodoScreen extends StatefulWidget {
  final bool isEdit;
  final String? title, description, id;

  const AddTodoScreen(
      {super.key, this.isEdit = false, this.title, this.description, this.id});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  String titleError = "";
  String desError = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isEdit) {
      titleController.text = widget.title.toString();
      desController.text = widget.description.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isEdit ? const Text("Edit") : const Text("Add List"),
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
                  if (widget.isEdit) {
                    updateToServer();
                  } else {
                    postToServer();
                  }
                },
                child: widget.isEdit
                    ? const Text("Update")
                    : const Text(
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

  void postToServer() {
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
      Navigator.pop(context, true);
      TService.postTodoList(title: title, description: description);
    }
  }

  void updateToServer() {
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
      Navigator.pop(context, true);
      TService.editById(id: widget.id, title: title, description: description);
    }
  }
}

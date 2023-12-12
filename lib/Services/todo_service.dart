import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:todo/Models/TodoListModel.dart';
import 'package:todo/Utils/urls.dart';

class TodoService {
  static Future<void> postTodoList(
      {required String title,
      required String description,
      required BuildContext context}) async {
    final todoBody = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final header = {'Content-Type': 'application/json'};
    final uri = Uri.parse(TUrls.postUrl);
    final response =
        await http.post(uri, body: jsonEncode(todoBody), headers: header);
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Save to Server!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  static Future<TodoListModel> getTodoList() async {
    final response = await http.get(Uri.parse(TUrls.getUrl));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // print("Ahmad :${response.statusCode}");
      return TodoListModel.fromJson(data);
    } else {
      return TodoListModel();
    }
  }
}

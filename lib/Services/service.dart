import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:todo/Models/GetListModel.dart';
import 'package:todo/Utils/urls.dart';

class TService {
  static Future<TodoListModel> getTodoList() async {
    final response = await http.get(Uri.parse(TUrls.getUrl));
    final data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      final todoListModel = TodoListModel.fromJson(data);
      while (todoListModel.meta?.hasMorePage == true) {
        final nextPageResponse = await http.get(Uri.parse(
            '${TUrls.getUrl}?page=${todoListModel.meta!.currentPage! + 1}'));
        if (nextPageResponse.statusCode == 200) {
          final nextPageModel =
              TodoListModel.fromJson(json.decode(nextPageResponse.body));

          // Append items from the next page
          todoListModel.items?.addAll(nextPageModel.items!);

          // Update meta information for the current page
          todoListModel.meta = nextPageModel.meta;

          // Update the current page number
          todoListModel.meta!.currentPage = nextPageModel.meta!.currentPage;
        } else {
          throw Exception('Failed to load todo list');
        }
      }

      return todoListModel;
    } else {
      return TodoListModel();
    }
  }

  static Future<void> postTodoList(
      {required String title, required String description}) async {
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
          msg: "Success!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Failed!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future editById(
      {required String? id,
      required String title,
      required String description}) async {
    final todoBody = {
      "title": title,
      "description": description,
      "is_completed": false
    };
    final header = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final uri = Uri.parse(TUrls.putUrl + id!);
    final response =
        await http.put(uri, body: jsonEncode(todoBody), headers: header);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Update",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Update Error ! $id",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static Future<void> deleteById({required String? id}) async {
    final uri = Uri.parse(TUrls.deleteUrl + id!);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Delete",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

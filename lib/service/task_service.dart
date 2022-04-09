import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ctse_frontend/model/task_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TaskService extends GetConnect {
  static var client = http.Client();

  static Future<Task> getTasks(int page, int size) async {
    Task result;

    try {
      final response = await client.get(
        Uri.parse("http://192.168.8.101:8080/api/v1/tasks?page=" +
            page.toString() +
            "&size=" +
            size.toString() +
            "&sort=".toString()),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        Task taskFromJson3 = taskFromJson(response.body);
        return taskFromJson3;
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //Save Data
 
  //Save Data
  Future<String> saveTask(Map data) async {
    try {
      final response =
          await post("http://192.168.8.101:8080/api/v1/tasks", data);

      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return response.body['result'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

//update
  static Future<Task> updateTask(Map data, String id) async {
    Task result;

    try {
      final response = await client.put(
          Uri.parse("http://192.168.8.101:8080/api/v1/tasks/$id"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(data));
      if (response.statusCode == 200) {
        Task taskFromJson3 = taskFromJson(response.body);
        return taskFromJson3;
      } else {
        print(response);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //delete
  Future<String> deleteTask(String id) async {
    try {
      final response =
          await delete("http://192.168.8.101:8080/api/v1/tasks/$id");
      if (response.status.hasError) {
        return Future.error(response.statusText);
      } else {
        return response.body['result'];
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

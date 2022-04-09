import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ctse_frontend/model/project_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProjectService extends GetConnect {
  static var client = http.Client();

  static Future<Project> getProjects(int page, int size) async {
    Project result;

    try {
      final response = await client.get(
        Uri.parse("http://192.168.8.101:8080/api/v1/projects?page=" +
            page.toString() +
            "&size=" +
            size.toString() +
            "&sort=".toString()),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        Project projectFromJson3 = projectFromJson(response.body);
        return projectFromJson3;
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //Save Data
  Future<String> saveProject(Map data) async {
    try {
      final response =
          await post("http://192.168.8.101:8080/api/v1/projects", data);

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
  static Future<Project> updateProject(Map data, String id) async {
    Project result;

    try {
      final response = await client.put(
          Uri.parse("http://192.168.8.101:8080/api/v1/projects/$id"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(data));
      if (response.statusCode == 200) {
        Project projectFromJson3 = projectFromJson(response.body);
        return projectFromJson3;
      } else {
        print(response);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //delete
  Future<String> deleteProject(String id) async {
    try {
      final response =
          await delete("http://192.168.8.101:8080/api/v1/projects/$id");
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

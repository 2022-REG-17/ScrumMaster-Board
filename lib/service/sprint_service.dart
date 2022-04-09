import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ctse_frontend/model/sprint_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SprintService extends GetConnect {
  static var client = http.Client();

  static Future<Sprint> getSprints(int page, int size) async {
    Sprint result;

    try {
      final response = await client.get(
        Uri.parse("http://192.168.8.101:8080/api/v1/sprints?page=" +
            page.toString() +
            "&size=" +
            size.toString() +
            "&sort=".toString()),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        Sprint sprintFromJson3 = sprintFromJson(response.body);
        return sprintFromJson3;
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //Save Data
  Future<String> saveSprint(Map data) async {
    try {
      final response =
          await post("http://192.168.8.101:8080/api/v1/sprints", data);

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
  static Future<Sprint> updateSprint(Map data, String id) async {
    Sprint result;

    try {
      final response = await client.put(
          Uri.parse("http://192.168.8.101:8080/api/v1/sprints/$id"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(data));
      if (response.statusCode == 200) {
        Sprint sprintFromJson3 = sprintFromJson(response.body);
        return sprintFromJson3;
      } else {
        print(response);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //delete
  Future<String> deleteSprint(String id) async {
    try {
      final response =
          await delete("http://192.168.8.101:8080/api/v1/sprints/$id");
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

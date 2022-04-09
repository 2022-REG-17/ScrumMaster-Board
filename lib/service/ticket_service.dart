import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ctse_frontend/model/ticket_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TicketService extends GetConnect {
  static var client = http.Client();

  static Future<Ticket> getTickets(int page, int size) async {
    Ticket result;

    try {
      final response = await client.get(
        Uri.parse("http://192.168.8.101:8080/api/v1/tickets?page=" +
            page.toString() +
            "&size=" +
            size.toString() +
            "&sort=".toString()),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );

      if (response.statusCode == 200) {
        Ticket ticketFromJson3 = ticketFromJson(response.body);
        return ticketFromJson3;
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //Save Data
  Future<String> saveTicket(Map data) async {
    try {
      final response =
          await post("http://192.168.8.101:8080/api/v1/tickets", data);

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
  static Future<Ticket> updateTicket(Map data, String id) async {
    Ticket result;

    try {
      final response = await client.put(
          Uri.parse("http://192.168.8.101:8080/api/v1/tickets/$id"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(data));
      if (response.statusCode == 200) {
        Ticket ticketFromJson3 = ticketFromJson(response.body);
        return ticketFromJson3;
      } else {
        print(response);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  //delete
  Future<String> deleteTicket(String id) async {
    try {
      final response =
          await delete("http://192.168.8.101:8080/api/v1/tickets/$id");
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

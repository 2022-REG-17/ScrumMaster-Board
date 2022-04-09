// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
    Ticket({
        this.data,
        this.totalRecords,
    });

    List<Datum3> data;
    int totalRecords;

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        data: List<Datum3>.from(json["data"].map((x) => Datum3.fromJson(x))),
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecords": totalRecords,
    };
}

class Datum3 {
    Datum3({
        this.id,
        this.name,
        this.createdDate,
        this.description,
        this.status,
        this.comment,
    });

    String id;
    String name;
    String createdDate;
    String description;
    String status;
    String comment;

    factory Datum3.fromJson(Map<String, dynamic> json) => Datum3(
        id: json["_id"],
        name: json["name"],
        createdDate: json["createdDate"],
        description: json["description"],
        status: json["status"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdDate": createdDate,
        "description": description,
        "status": status,
        "comment": comment,
    };
}

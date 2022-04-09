// To parse this JSON data, do
//
//     final sprint = sprintFromJson(jsonString);

import 'dart:convert';

Sprint sprintFromJson(String str) => Sprint.fromJson(json.decode(str));

String sprintToJson(Sprint data) => json.encode(data.toJson());

class Sprint {
    Sprint({
        this.data,
        this.totalRecords,
    });

    List<Datum1> data;
    int totalRecords;

    factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
        data: List<Datum1>.from(json["data"].map((x) => Datum1.fromJson(x))),
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecords": totalRecords,
    };
}

class Datum1 {
    Datum1({
        this.id,
        this.name,
        this.startDate,
        this.dueDate,
    });

    String id;
    String name;
    String startDate;
    String dueDate;

    factory Datum1.fromJson(Map<String, dynamic> json) => Datum1(
        id: json["_id"],
        name: json["name"],
        startDate: json["startDate"],
        dueDate: json["dueDate"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "startDate": startDate,
        "dueDate": dueDate,
    };
}

// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
    Task({
        this.data,
        this.totalRecords,
    });

    List<Datum2> data;
    int totalRecords;

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        data: List<Datum2>.from(json["data"].map((x) => Datum2.fromJson(x))),
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecords": totalRecords,
    };
}

class Datum2 {
    Datum2({
        this.id,
        this.name,
        this.description,
        this.status,
        this.member,
        this.comment,
    });

    String id;
    String name;
    String description;
    String status;
    String member;
    String comment;

    factory Datum2.fromJson(Map<String, dynamic> json) => Datum2(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        member: json["member"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "status": status,
        "member": member,
        "comment": comment,
    };
}

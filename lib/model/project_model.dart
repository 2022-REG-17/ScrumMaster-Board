import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
    Project({
        this.data,
        this.totalRecords,
    });

    List<Datum> data;
    int totalRecords;

    factory Project.fromJson(Map<String, dynamic> json) => Project(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalRecords: json["totalRecords"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalRecords": totalRecords,
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.createdDate,
        this.admin,
        this.member,
    });

    String id;
    String name;
    String createdDate;
    String admin;
    String member;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        createdDate: json["createdDate"],
        admin: json["admin"],
        member: json["member"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdDate": createdDate,
        "admin": admin,
        "member": member,
    };
}

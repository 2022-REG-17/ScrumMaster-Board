import 'package:ctse_frontend/View/TaskPage.dart';
import 'package:ctse_frontend/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class Edit_Task extends StatefulWidget {
  final String id;
  final String name;
final String description;
final String status;
final String member;
final String comment;

Edit_Task({this.id, this.name, this.description, this.status, this.member, this.comment});
@override
  State<Edit_Task> createState() => _Edit_TaskState();
}
class _Edit_TaskState extends State<Edit_Task> {

TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TaskPage(
                  
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: new Container(
              padding: const EdgeInsets.all(27.0),
              color: Colors.white,
              child: new Container(
                child: new Center(
                    child: new Column(children: [
                  Text("Edit Task Details", style: TextStyle(fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Task Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: taskController.tasknameEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "UI Designing",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Task description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  new TextFormField(
                    controller: taskController.taskdesEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Create all UI",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: taskController.taskstatusEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "done",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Assigned Members",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: taskController.taskmemEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Viki, Sornaka",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Comments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: taskController.taskcommentEditingController,
                    decoration: new InputDecoration(
                      hintText: "UIs created",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(taskController.isProcessing.value == true
                                  ? 'Processing'
                                  : 'Update',
                              style: TextStyle(fontSize: 20)),
                          color: Colors.teal,
                          textColor: Colors.white,
                          elevation: 5,
                        ),
                      ),
                      SizedBox(width: 10),
                      Align(
                        alignment: Alignment.bottomCenter,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                             Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TaskPage(
                           
                          ),
                        ),
                      );
                          },
                          child: const Text('Cancel',
                              style: TextStyle(fontSize: 20)),
                          color: Colors.red,
                          textColor: Colors.white,
                          elevation: 5,
                        ),
                      ),
                    ],
                  ),
                ])),
              )),
        ));
  }
}

import 'package:ctse_frontend/View/SprintPage.dart';
import 'package:ctse_frontend/View/SprintTaskPage.dart';
import 'package:ctse_frontend/View/TaskPage.dart';
import 'package:ctse_frontend/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// ignore: camel_case_types
class Add_task extends StatefulWidget {
  const Add_task({Key key}) : super(key: key);

  @override
  State<Add_task> createState() => _Add_taskState();
}

// ignore: camel_case_types
class _Add_taskState extends State<Add_task> {
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SprintTaskPage()),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: new Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.white,
              child: new Container(
                child: new Center(
                    child: new Column(children: [
                  Text("Create Task ", style: TextStyle(fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  new TextFormField(
                    controller: taskController.tasknameEditingController,
                    decoration: new InputDecoration(
                      labelText: "Enter task Name",
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
                  new TextFormField(
                    controller: taskController.taskdesEditingController,
                    decoration: new InputDecoration(
                      labelText: "Enter task description",
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
                    height: 40,
                  ),
                  new TextFormField(
                    controller: taskController.taskmemEditingController,
                    decoration: new InputDecoration(
                      labelText: "Assigned Members",
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
                    height: 40,
                  ),
                  new TextFormField(
                    controller: taskController.taskstatusEditingController,
                    decoration: new InputDecoration(
                      labelText: "Status",
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
                    height: 40,
                  ),
                  new TextFormField(
                    controller: taskController.taskcommentEditingController,
                    decoration: new InputDecoration(
                      labelText: "Comments",
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
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                              color: Colors.teal,
                                onPressed: () async {
                                  if (taskController.isProcessing.value ==
                                      false) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TaskPage(
                                            title: 'Tasks',
                                          ),
                                        ));
                                    saveTask(
                                      taskController
                                          .tasknameEditingController.text,
                                      taskController
                                          .taskdesEditingController.text,
                                      taskController
                                          .taskstatusEditingController.text,
                                      taskController
                                          .taskmemEditingController.text,
                                      taskController
                                          .taskcommentEditingController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  taskController.isProcessing.value == true
                                      ? 'Processing'
                                      : 'Create',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
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
                                  builder: (context) => TaskPage(
                                    title: 'Tasks',
                                  ),
                                ));
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

  void saveTask(String name, String description, String status, String member,
      String comment) {
    taskController.saveTask({
      'name': name,
      'description': description,
      'status': status,
      'member': member,
      'comment': comment,
    });
    Get.back();
  }
}

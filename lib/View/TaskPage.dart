// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore
import 'package:ctse_frontend/Edit/editTask.dart';
import 'package:ctse_frontend/View/SprintTaskPage.dart';
import 'package:ctse_frontend/View/TicketPage.dart';
import 'package:ctse_frontend/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Add/addTask.dart';
import 'package:ctse_frontend/colors/colors.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskController taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SprintTaskPage()),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text("Task List ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Obx(() {
                      if (taskController.isDataProcessing.value == true) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (taskController.TaskTask.length > 0) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              controller: taskController.scrollController,
                              itemCount: taskController.TaskTask.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index ==
                                        taskController.TaskTask.length - 1 &&
                                    taskController.isMoreDataAvailable.value ==
                                        true) {
                                  //return Center(child: CircularProgressIndicator());
                                }
                                return Card(
                                  child: Container(
                                    margin: EdgeInsets.all(10.0),
                                    child: Column(children: [
                                      ListTile(
                                        title: Text(
                                          taskController.TaskTask[index].name,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Description",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.6),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            taskController
                                                .TaskTask[index].description,
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Status",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.6),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            taskController
                                                .TaskTask[index].status,
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Members",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.6),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            taskController
                                                .TaskTask[index].member,
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                      SizedBox(height: 20),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Comments",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(top: 3.6),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            taskController
                                                .TaskTask[index].comment,
                                            style: TextStyle(fontSize: 15)),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 160, top: 5),
                                          child: Row(children: [
                                            // ignore: deprecated_member_use
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TicketPage(
                                                      title: 'Tickets',
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text('Tickets',
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              color: Colors.teal,
                                              textColor: Colors.white,
                                              elevation: 5,
                                            ),
                                            SizedBox(width: 15),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              color: Colors.teal,
                                              onPressed: () {
                                              
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Edit_Task(
                                                     taskController
                                                    .TaskTask[index].id,
                                                taskController.tasknameEditingController.text = taskController
                                                    .TaskTask[index].name,
                                                taskController.taskdesEditingController.text = taskController.TaskTask[index].description,
                                                   taskController.taskstatusEditingController.text = taskController.TaskTask[index].status,

                                              
                                               taskController.taskmemEditingController.text=taskController.
                                                    TaskTask[index].member,
                                               taskController.taskcommentEditingController.text = taskController
                                                    .TaskTask[index].comment
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              color: Colors.red,
                                              onPressed: () {
                                                displayDeleteDialog(
                                                    taskController
                                                        .TaskTask[index].id);
                                              },
                                            ),
                                          ])),
                                    ]),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: colors.green1,
                            ),
                          );
                        }
                      }
                    }),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.green1,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Add_task(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: colors.Navbarcolor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayDeleteDialog(String id) {
    Get.defaultDialog(
      title: "Delete Task",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete task ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        taskController.deleteTask(id);
        Get.back();
      },
    );
  }
}

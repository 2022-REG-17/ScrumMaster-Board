// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore
import 'package:ctse_frontend/Add/addSprint.dart';
import 'package:ctse_frontend/Edit/editsprint.dart';
import 'package:ctse_frontend/View/SprintTaskPage.dart';
import 'package:ctse_frontend/controller/sprint_controller.dart';
import 'package:flutter/material.dart';
import 'package:ctse_frontend/colors/colors.dart';
import 'package:get/get.dart';

class SprintPage extends StatefulWidget {
  const SprintPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<SprintPage> createState() => _SprintPageState();
}

class _SprintPageState extends State<SprintPage> {
  SprintController sprintController = Get.put(SprintController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SprintTaskPage(),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text("Sprint List ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SprintTaskPage(),
                      ),
                    );
                  },
                  child: Obx(() {
                    if (sprintController.isDataProcessing.value == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (sprintController.SprintTask.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: sprintController.scrollController,
                            itemCount: sprintController.SprintTask.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index ==
                                      sprintController.SprintTask.length - 1 &&
                                  sprintController.isMoreDataAvailable.value ==
                                      true) {
                                //return Center(child: CircularProgressIndicator());
                              }
                              return Card(
                                child: Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    ListTile(
                                      title: Text(
                                          sprintController.SprintTask[index]
                                              .name,
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    SizedBox(height: 20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Start Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3.6),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          sprintController.SprintTask[index]
                                              .startDate
                                              .toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    SizedBox(height: 20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Due Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3.6),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          sprintController.SprintTask[index]
                                             .dueDate
                                              .toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 260, top: 5),
                                        child: Row(children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            color: Colors.teal,
                                            onPressed: () {
                                            
                                              
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Edit_Sprint(
                                                         sprintController.SprintTask[index].id,
                                              sprintController.sprintnameEditingController.text=sprintController.SprintTask[index].name,
                                              sprintController.startdateEditingController.text=sprintController.SprintTask[index].startDate,
                                              sprintController.duedateEditingController.text=sprintController.SprintTask[index].dueDate
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
                                                  sprintController
                                                      .SprintTask[index].id);
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.green1,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Add_sprint(),
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
                children: const [],
              ),
            ],
          ),
        ),
      ),
    );
  }
  displayDeleteDialog(String id) {
    Get.defaultDialog(
      title: "Delete Sprint",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete sprint ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        sprintController.deleteSprint(id);
        Get.back();
      },
    );
  }
}

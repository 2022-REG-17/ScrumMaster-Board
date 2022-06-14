import 'package:ctse_frontend/Add/addProject.dart';
import 'package:ctse_frontend/Edit/editProject.dart';
import 'package:ctse_frontend/controller/project_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ctse_frontend/colors/colors.dart';
import '../main.dart';
import 'SprintTaskPage.dart';
import 'TicketPage.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  ProjectController projectController = Get.put(ProjectController());
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

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
              builder: (context) => const HomePage(
                title: 'Scrum Board',
              ),
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
              child: Text("Project List ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    if (projectController.isDataProcessing.value == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (projectController.ProjectTask.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: projectController.scrollController,
                            itemCount: projectController.ProjectTask.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index ==
                                      projectController.ProjectTask.length -
                                          1 &&
                                  projectController.isMoreDataAvailable.value ==
                                      true) {
                                //return Center(child: CircularProgressIndicator());
                              }
                              return Card(
                                child: Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    ListTile(
                                      title: Text(
                                        projectController
                                            .ProjectTask[index].name,
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Created Date",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3.6),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          projectController
                                              .ProjectTask[index].createdDate
                                              .toString(),
                                          style: TextStyle(fontSize: 15)),
                                    ),
                                    SizedBox(height: 20),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Admin",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3.6),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          projectController
                                              .ProjectTask[index].admin,
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
                                          projectController
                                              .ProjectTask[index].member,
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
                                              String id = projectController
                                                  .ProjectTask[index].id;
                                              String name = projectController
                                                  .ProjectTask[index].name;
                                              String createdDate =
                                                  projectController
                                                      .ProjectTask[index]
                                                      .createdDate;
                                              String admin = projectController
                                                  .ProjectTask[index].admin;
                                              String member = projectController
                                                  .ProjectTask[index].member;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Edit_project(
                                                          id: id,
                                                          name: name,
                                                          createdDate:
                                                              createdDate,
                                                          admin: admin,
                                                          member: member),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: () {
                                              displayDeleteDialog(
                                                  projectController
                                                      .ProjectTask[index].id);
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
              builder: (context) => const Add_project(),
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
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProjectPage(
                          title: 'Projects',
                        ),
                      ),
                    );
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  displayDeleteDialog(String id) {
    Get.defaultDialog(
      title: "Delete Project",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete project ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        projectController.deleteProject(id);
        Get.back();
      },
    );
  }
}

// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore
import 'package:ctse_frontend/Edit/editTicket.dart';
import 'package:ctse_frontend/View/TaskPage.dart';
import 'package:ctse_frontend/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Add/addTicket.dart';
import 'package:ctse_frontend/colors/colors.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TicketController ticketController = Get.put(TicketController());
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
              builder: (context) => const TaskPage(
                title: 'Tasks',
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
              child: Text("Ticket List ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: InkWell(
                  onTap: () {},
                  child: Obx(() {
                    if (ticketController.isDataProcessing.value == true) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (ticketController.TicketTask.length > 0) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller: ticketController.scrollController,
                            itemCount: ticketController.TicketTask.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index ==
                                      ticketController.TicketTask.length - 1 &&
                                  ticketController.isMoreDataAvailable.value ==
                                      true) {
                                //return Center(child: CircularProgressIndicator());
                              }
                              return Card(
                                child: Container(
                                  margin: EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    ListTile(
                                      title: Text(
                                          ticketController
                                              .TicketTask[index].name,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
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
                                          ticketController
                                              .TicketTask[index].createdDate
                                              .toString(),
                                          style: TextStyle(fontSize: 15)),
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
                                          ticketController
                                              .TicketTask[index].description
                                              .toString(),
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
                                          ticketController
                                              .TicketTask[index].status
                                              .toString(),
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
                                          ticketController
                                              .TicketTask[index].comment
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
                                                  builder: (context) => Edit_Ticket(
                                                      ticketController
                                                          .TicketTask[index].id,
                                                      ticketController.ticketnameEditingController.text =
                                                          ticketController
                                                              .TicketTask[index]
                                                              .name,
                                                      ticketController.ticketdateEditingController.text =
                                                          ticketController
                                                              .TicketTask[index]
                                                              .createdDate,
                                                      ticketController.ticketdesEditingController.text =
                                                          ticketController
                                                              .TicketTask[index]
                                                              .description,
                                                      ticketController
                                                              .ticketstatusEditingController
                                                              .text =
                                                          ticketController
                                                              .TicketTask[index]
                                                              .status,
                                                      ticketController
                                                              .ticketcommentEditingController
                                                              .text =
                                                          ticketController.TicketTask[index].comment),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: Colors.red,
                                            onPressed: () {
                                              displayDeleteDialog(
                                                  ticketController
                                                      .TicketTask[index].id);
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
              builder: (context) => Add_ticket(),
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
      title: "Delete Ticket",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete ticket ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        ticketController.deleteTicket(id);
        Get.back();
      },
    );
  }
}

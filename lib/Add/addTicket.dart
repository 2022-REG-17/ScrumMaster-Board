import 'package:ctse_frontend/View/SprintPage.dart';
import 'package:ctse_frontend/View/TaskPage.dart';
import 'package:ctse_frontend/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../main.dart';

// ignore: camel_case_types
class Add_ticket extends StatefulWidget {
  const Add_ticket({Key key}) : super(key: key);

  @override
  State<Add_ticket> createState() => _Add_ticketState();
}

// ignore: camel_case_types
class _Add_ticketState extends State<Add_ticket> {
  TicketController ticketController = Get.put(TicketController());

  @override
  void initState() {
    ticketController.ticketdateEditingController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TaskPage(title: 'TaskPage')),
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: new Container(
            child: new Center(
                child: new Column(children: [
              Text("Create Ticket ", style: TextStyle(fontSize: 20)),
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              new TextFormField(
                controller: ticketController.ticketnameEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter ticket Name",
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
                controller: ticketController.ticketdesEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter ticket description",
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
              TextField(
                controller: ticketController
                    .ticketdateEditingController, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      ticketController.ticketdateEditingController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              new TextFormField(
                controller: ticketController.ticketstatusEditingController,
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
                controller: ticketController.ticketcommentEditingController,
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
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 20,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () async {
                              if (ticketController.isProcessing.value ==
                                  false) {
                                print("success");
                                saveTicket(
                                  ticketController
                                      .ticketnameEditingController.text,
                                  ticketController
                                      .ticketdateEditingController.text,
                                  ticketController
                                      .ticketdesEditingController.text,
                                  ticketController
                                      .ticketstatusEditingController.text,
                                  ticketController
                                      .ticketcommentEditingController.text,
                                );
                              }
                            },
                            child: Text(
                              ticketController.isProcessing.value == true
                                  ? 'Processing'
                                  : 'Create',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {},
                      child:
                          const Text('Cancel', style: TextStyle(fontSize: 20)),
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ])),
          )),
    );
  }

  void saveTicket(String name, String createdDate, String description,
      String status, String comment) {
    ticketController.saveTicket({
      'name': name,
      'createdDate': createdDate,
      'description': description,
      'status': status,
      'comment': comment,
    });
    Get.back();
  }
}

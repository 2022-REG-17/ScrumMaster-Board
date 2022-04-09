import 'package:ctse_frontend/View/SprintPage.dart';
import 'package:ctse_frontend/View/SprintTaskPage.dart';
import 'package:ctse_frontend/controller/sprint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../main.dart';

// ignore: camel_case_types
class Add_sprint extends StatefulWidget {
  const Add_sprint({Key key}) : super(key: key);

  @override
  State<Add_sprint> createState() => _Add_sprintState();
}

// ignore: camel_case_types
class _Add_sprintState extends State<Add_sprint> {
  SprintController sprintController = Get.put(SprintController());

  @override
  void initState() {
    sprintController.startdateEditingController.text = "";
    sprintController.duedateEditingController.text =
        ""; //set the initial value of text field
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
            MaterialPageRoute(builder: (context) => SprintTaskPage()),
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
              Text("Create Sprint ", style: TextStyle(fontSize: 20)),
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              new TextFormField(
                controller: sprintController.sprintnameEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter Sprint Name",
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
              TextField(
                controller: sprintController
                    .startdateEditingController, //editing controller of this TextField
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
                      sprintController.startdateEditingController.text =
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
              TextField(
                controller: sprintController
                    .duedateEditingController, //editing controller of this TextField
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
                      sprintController.duedateEditingController.text =
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
                              if (sprintController.isProcessing.value ==
                                  false) {
                                print("success");
                                saveSprint(
                                  sprintController
                                      .sprintnameEditingController.text,
                                  sprintController
                                      .startdateEditingController.text,
                                  sprintController
                                      .duedateEditingController.text,
                                );
                              }
                            },
                            child: Text(
                              sprintController.isProcessing.value == true
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

  void saveSprint(String name, String startDate, String dueDate) {
    sprintController.saveSprint({
      'name': name,
      'startDate': startDate,
      'dueDate': dueDate,
    });
    Get.back();
  }
}

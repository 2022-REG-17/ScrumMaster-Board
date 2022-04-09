import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/controller/project_controller.dart';
import 'package:ctse_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Edit_project extends StatefulWidget {
  final String id;
  final String name;
final String createdDate;
final String admin;
final String member;
Edit_project({this.id, this.name, this.createdDate, this.admin, this.member});
  @override
  State<Edit_project> createState() => _Edit_projectState();
}

// ignore: camel_case_types
class _Edit_projectState extends State<Edit_project> {

ProjectController projectController = Get.put(ProjectController());

 @override
  void initState() {
    projectController.dateEditingController.text = ""; //set the initial value of text field
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  title: 'Projects',
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
                  Text("Edit Project Details", style: TextStyle(fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Project Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    cursorColor: Colors.white,
                    controller: projectController.pronameEditingController,
                    decoration: new InputDecoration( 
                      hintText: "",
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
                        "Created Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                controller: projectController.dateEditingController, //editing controller of this TextField
                decoration: InputDecoration( 
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                   icon: Icon(Icons.calendar_today), //icon of text field
                   hintText: "",
                      hintStyle: TextStyle(color: Colors.black),
                ),
                readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  ); 
                  if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                         projectController.dateEditingController.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
             ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Admin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    cursorColor: Colors.white,
                    controller: projectController.adminEditingController,
                    decoration: new InputDecoration(
                      hintText: "",
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
                        "Members",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    cursorColor: Colors.white,
                    controller: projectController.memberEditingController,
                    decoration: new InputDecoration(
                      hintText: "",
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
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                    alignment: Alignment.bottomCenter,
                    // ignore: deprecated_member_use
                    child:RaisedButton( 
                      color: Colors.teal,
                            onPressed: () async {
                              if(projectController.isProcessing.value == false) {
                                updateProject(
                                  "624f4663f7d92662b123c924",
                                  projectController.pronameEditingController.text,
                                  projectController.dateEditingController.text,
                                  projectController.adminEditingController.text,
                                  projectController.memberEditingController.text,
                                );
                              }
                            },
                            child: Text(
                              projectController.isProcessing.value == true
                                  ? 'Processing'
                                  : 'Update',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.black,
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
                                builder: (context) => const HomePage(
                                  title: '',
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
  void updateProject(
      String id, String name, String createdDate, String admin, String member) {
    projectController.updateProject({
      "_id": "624f4663f7d92662b123c924",
    "name": "CTSE",
    "createdDate": "2022-04-08",
    "admin": "kishosiva13@gmail.com",
    "member": "Souji@gmail.com"
    }, id);
    Get.back();
  }
}

import 'package:ctse_frontend/controller/project_controller.dart';
import 'package:ctse_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Add_project extends StatefulWidget {
  const Add_project({Key key}) : super(key: key);

  @override
  State<Add_project> createState() => _Add_projectState();
}

class _Add_projectState extends State<Add_project> {
  
  ProjectController projectController = Get.put(ProjectController());
  
  @override
  void initState() {
    projectController.dateEditingController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
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
        centerTitle: true,
      ),
      body: new Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: new Container(
            child: new Center(
                child: new Column(children: [
              Text("Create Project ", style: TextStyle(fontSize: 20)),
              new Padding(padding: EdgeInsets.only(top: 50.0)),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Project Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              SizedBox(
                height: 10,
              ),
              new TextFormField(
                controller: projectController.pronameEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter Project Name",
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                   labelText: "Enter Date" //label text of field
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              SizedBox(
                height: 10,
              ),
              new TextFormField(
                controller: projectController.adminEditingController,
                decoration: new InputDecoration(
                  labelText: "Enter admin",
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              SizedBox(
                height: 10,
              ),
              new TextFormField(
                controller: projectController.memberEditingController,
                decoration: new InputDecoration(
                  labelText: "Members",
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
                            
                            onPressed: () async {
                            
                              if (projectController.isProcessing.value ==
                                   false) {
                                     print("success");
                                 saveProject(
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
                                  : 'Create',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
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
                            builder: (context) => const HomePage(
                              title: '',
                            ),
                          ),
                        );
                      },
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

  

  void saveProject(
      String name, String createdDate, String admin, String member) {
    projectController.saveProject({
      'name': name,
      'createdDate': createdDate,
      'admin': admin,
      'member': member,
    });
    Get.back();
  }
}


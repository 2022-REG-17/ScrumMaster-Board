import 'package:ctse_frontend/View/SprintPage.dart';
import 'package:ctse_frontend/controller/sprint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Edit_Sprint extends StatefulWidget {
  final String id;
  final String name;
final String startDate;
final String dueDate;

Edit_Sprint({this.id, this.name, this.startDate, this.dueDate});
@override
  State<Edit_Sprint> createState() => _Edit_SprintState();
}
class _Edit_SprintState extends State<Edit_Sprint> {

SprintController sprintController = Get.put(SprintController());
 @override
  void initState() {
    sprintController.startdateEditingController.text = ""; //set the initial value of text field
    sprintController.duedateEditingController.text = "";
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
                builder: (context) => SprintPage()
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
                  Text("Edit Sprint Details", style: TextStyle(fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Edit Sprint Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  new TextFormField(
                    controller: sprintController.sprintnameEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Sprint 1",
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
                        "Edit Start Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                controller: sprintController.startdateEditingController, //editing controller of this TextField
                decoration: InputDecoration( 
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                   icon: Icon(Icons.calendar_today), //icon of text field
                   hintText: "2022-04-06",
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
                         sprintController.startdateEditingController.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
             ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Edit Due Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                controller: sprintController.duedateEditingController, //editing controller of this TextField
                decoration: InputDecoration( 
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                   icon: Icon(Icons.calendar_today), //icon of text field
                   hintText: "2022-04-20",
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
                         sprintController.duedateEditingController.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
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
                          child: Text(
                            sprintController.isProcessing.value == true
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
                          builder: (context) => const SprintPage(
                           
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

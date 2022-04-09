import 'package:ctse_frontend/View/TicketPage.dart';
import 'package:ctse_frontend/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Edit_Ticket extends StatefulWidget {
  final String id;
  final String name;
final String createdDate;
final String description;
final String status;
final String comment;

Edit_Ticket({this.id, this.name, this.createdDate, this.description, this.status, this.comment});
@override
  State<Edit_Ticket> createState() => _Edit_TicketState();
}
class _Edit_TicketState extends State<Edit_Ticket> {

TicketController ticketController = Get.put(TicketController());
@override
  void initState() {
    ticketController.ticketdateEditingController.text = ""; //set the initial value of text field
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
                builder: (context) => TicketPage(),
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
                  Text("Edit Ticket Details", style: TextStyle(fontSize: 20)),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ticket Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: ticketController.ticketnameEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Colour Changed",
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
                        "Ticket description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  new TextFormField(
                    controller: ticketController.ticketdesEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "change UI colour",
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
                controller: ticketController.ticketdateEditingController, //editing controller of this TextField
                decoration: InputDecoration( 
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    borderSide: new BorderSide(),
                  ),
                   icon: Icon(Icons.calendar_today), //icon of text field
                   hintText: "2022-04-08",
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
                         ticketController.ticketdateEditingController.text = formattedDate; //set output date to TextField value. 
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
                        "Status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: ticketController.ticketstatusEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Unresolved",
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
                        "Comments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  new TextFormField(
                    controller: ticketController.ticketcommentEditingController,
                    cursorColor: Colors.white,
                    decoration: new InputDecoration(
                      hintText: "Do it as soon as possible",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(ticketController.isProcessing.value == true
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
                                builder: (context) => const TicketPage(),
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

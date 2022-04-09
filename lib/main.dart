// ignore_for_file: curly_braces_in_flow_control_structures, sized_box_for_whitespace
import 'package:ctse_frontend/Settings/notifications.dart';
import 'package:ctse_frontend/SupportCenter/faq.dart';
import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'View/ProjectPage.dart';
import 'View/SprintTaskPage.dart';
import 'View/TicketPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrum Board',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Onboarding(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 30),
        Row(children: [
          SizedBox(width: 30),
          Positioned(
            top: 12,
            right: 5,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
          ),
          SizedBox(width: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(YonoGreetings.showGreetings() + ' ' + 'Souji!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                )),
          )
        ]),
        SizedBox(height: 40),
        Container(
            height: 280,
            width: 600,
            child: Image.asset('assets/images/scrum.jpg')),
        SizedBox(height: 50),
        Container(
            height: 200,
            width: 300,
            child: Card(
              color: colors.green1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Projects',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: colors.bgColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 230, top: 80),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_outlined),
                        color: Colors.teal,
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
                      ),
                    ),
                  ],
                ),
              ),
            )),
        SizedBox(height: 30),
        Container(
            child: Row(children: [
          SizedBox(width: 20),
          Container(
              height: 160,
              width: 150,
              child: Card(
                color: Colors.teal,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Create Sprints & Tasks',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colors.bgColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 80, top: 15),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_outlined),
                          color: colors.bgColor,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SprintTaskPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(width: 50),
          Container(
              height: 160,
              width: 150,
              child: Card(
                color: colors.green1,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Create Tickets',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: colors.bgColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90, top: 30),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_outlined),
                          color: Colors.teal,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TicketPage(
                                  title: 'Tickets',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ])),
      ])),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(
                            title: 'Scrum Board',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.home_outlined),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Account",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //right
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FaqScreen(
                            title: 'Help',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.help),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Help",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SettingsScreen(title: 'Settings'),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.settings
                            // color: Colors.black,
                            ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

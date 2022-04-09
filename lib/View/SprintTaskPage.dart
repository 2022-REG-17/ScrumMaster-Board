// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore
import 'package:ctse_frontend/View/ProjectPage.dart';
import 'package:ctse_frontend/View/SprintPage.dart';
import 'package:ctse_frontend/View/TaskPage.dart';
import 'package:flutter/material.dart';

class SprintTaskPage extends StatefulWidget {
  const SprintTaskPage({Key key}) : super(key: key);

  @override
  State<SprintTaskPage> createState() => _SprintTaskPageState();
}

class _SprintTaskPageState extends State<SprintTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ProjectPage(title: 'Projects'),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 300),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TaskPage(title: 'Tasks'),
                      ),
                    );
                  },
                  child: const Text('Tasks', style: TextStyle(fontSize: 20)),
                  color: Colors.teal,
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SprintPage(
                          title: 'Sprints',
                        ),
                      ),
                    );
                  },
                  child: const Text('Sprints', style: TextStyle(fontSize: 20)),
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

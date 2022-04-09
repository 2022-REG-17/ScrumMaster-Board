import 'package:ctse_frontend/main.dart';
import 'package:ctse_frontend/SupportCenter/faq_model.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
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
                    )),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text("FAQ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqcontents.length,
              itemBuilder: (_, i) {
                return Container(
                    height: 150,
                    child: Card(
                      child: ExpansionTile(
                        title: Text(
                          faqcontents[i].question,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        iconColor: Colors.teal,
                        collapsedTextColor: Colors.teal,
                        collapsedIconColor: Colors.black,
                        textColor: Colors.teal,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              faqcontents[i].answer,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                faqcontents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

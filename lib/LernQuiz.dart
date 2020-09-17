import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LearnQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LearnQuizState();
  }
}

class LearnQuizState extends State<LearnQuiz> {
  String quizid = '0';
  List fragenList;

  void quizFragen() async {
    var url = "http://zukunft.sportsocke522.de/quiz.php";
    var data = {"quizID": quizid};

    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "Datensatz existiert nicht") {
      print('Datensatz nicht gefunden');
    } else {
      print(jsonDecode(res.body));
      fragenList = jsonDecode(res.body);

      print(fragenList[0]['frage']);
      print(fragenList[0]['antwort'].length);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    quizFragen();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Multiple Choice Quiz"),
        backgroundColor: Colors.blue,
      ),
      body: new Container(
        margin: const EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: new Text(
                  "Ort 1",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void startQuiz() {
    setState(() {
      Navigator.pushReplacementNamed(context, '/quizapp',
          arguments: fragenList);
    });
  }
}

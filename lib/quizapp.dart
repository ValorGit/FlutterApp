import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_funktion.dart';

QuizFunktion quiz = new QuizFunktion();

class QuizApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text(
            'Quizmasters',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Widget> punkteBehalten = [];

  int sumPunkte = 0;
  int positionFragen = 0;
  int punkteProFragen = 1;
  Map data = {};

  void checkAnswer(String value) {
    if (quiz.getAnswer() == value) {
      print('right answer');
      punkteBehalten.add(Icon(Icons.check, color: Colors.green));
      sumPunkte = sumPunkte + positionFragen * 2 + punkteProFragen;
    } else {
      print('wrong answer');
      punkteBehalten.add(Icon(Icons.close, color: Colors.red));
    }
    positionFragen++;
    punkteProFragen++;
    if (quiz.isFinshed() == true) {
      Alert(
          context: context,
          title: 'Finished',
          desc: 'Final Score: $sumPunkte',
          buttons: [
            DialogButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Play Again',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ))
          ]).show();

      quiz.reset();
      punkteBehalten.clear();
      sumPunkte = 0;
      positionFragen = 0;
      punkteProFragen = 1;
    } else {
      quiz.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(10.0)),
              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Question ${positionFragen + 1} of ${quiz.questions.length}",
                      style: new TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.all(5.0)),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue[300],
                      ),
                      child: Center(
                        child: Text(
                          quiz.getQuestion(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          textColor: Colors.white,
                          color: Colors.greenAccent[400],
                          child: Text(
                            '${quiz.choices[positionFragen][0]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              checkAnswer('${quiz.choices[positionFragen][0]}');
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          textColor: Colors.white,
                          color: Colors.greenAccent[400],
                          child: Text(
                            '${quiz.choices[positionFragen][1]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              checkAnswer('${quiz.choices[positionFragen][1]}');
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          textColor: Colors.white,
                          color: Colors.greenAccent[400],
                          child: Text(
                            '${quiz.choices[positionFragen][2]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              checkAnswer('${quiz.choices[positionFragen][2]}');
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          textColor: Colors.white,
                          color: Colors.greenAccent[400],
                          child: Text(
                            '${quiz.choices[positionFragen][3]}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              checkAnswer('${quiz.choices[positionFragen][3]}');
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: new MaterialButton(
                      minWidth: 240.0,
                      height: 30.0,
                      color: Colors.red[300],
                      onPressed: resetQuiz,
                      child: new Text(
                        "Quit",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: punkteBehalten,
                ),
              ),
              /*Expanded(
                //flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    //alignment: Alignment.topCenter,
                    child: Center(
                      child: Text(
                        "100",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      sumPunkte = 0;
      positionFragen = 0;
    });
  }
}

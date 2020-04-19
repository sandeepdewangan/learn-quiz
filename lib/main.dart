import 'package:flutter/material.dart';
import 'package:quizapp/question_bank.dart';

import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: QuizApp(),
      ),
    ),
  ));
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  QuestionBank questionBank = QuestionBank();
  int questionNumber = 0;

  List<Widget> bottomMarker = [];

  void onUserResponse(bool userResponse){
    bool answer = questionBank.getQuestionAnswer(questionNumber);
    setState(() {
      // loop 0---4
      if(questionNumber+1 == questionBank.getTotalQuestions()){
        Alert(context: context, title: "Quiz Ends", desc: "Well Done...").show();
        questionNumber = 0;
      }
      if(userResponse == answer) {
        bottomMarker.add(Icon(Icons.check, color: Colors.green));
        questionNumber++;
      }
      else{
        questionNumber++;
        bottomMarker.add(Icon(Icons.clear, color: Colors.red));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                questionBank.getQuestionText(questionNumber),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 4),
            child: FlatButton(
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                ),
              ),
              color: Colors.green,
              onPressed: () {
                onUserResponse(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4, 12.0, 12.0),
            child: FlatButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white70,
                ),
              ),
              color: Colors.red,
              onPressed: () {
                onUserResponse(false);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Color.fromRGBO(240, 240, 245, .05),
            child: Row(
              children: bottomMarker,
            ),
          ),
        ),
      ],
    );
  }
}

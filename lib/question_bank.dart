import 'package:quizapp/question.dart';

class QuestionBank{

  List<Question> questions =[
    Question(questionText: 'India is a Country?', answer: true),
    Question(questionText: 'Delhi is Capital of America?', answer: false),
    Question(questionText: 'Raipur is situated near Ganga River?', answer: false),
    Question(questionText: 'Chhattisgarh produces huge amount of cotton?', answer: false),
    Question(questionText: 'Chhattisgarh is called Rice Bowl of India', answer: true)
  ];

  getQuestionText(int questionNumber){
    return questions[questionNumber].questionText;
  }

  getQuestionAnswer(int questionNumber){
    return questions[questionNumber].answer;
  }

  getTotalQuestions(){
    return questions.length;
  }

}
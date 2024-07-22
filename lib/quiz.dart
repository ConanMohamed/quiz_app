import 'package:flutter/material.dart';
import 'package:quiz_app/body.dart';
import 'package:quiz_app/data/questins.dart';
import 'package:quiz_app/question_page.dart';
import 'package:quiz_app/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAns = [];
  Widget? activeScreen ;

  void chosenAnswers(String answer){
    selectedAns.add(answer);
    if (selectedAns.length== questions.length) {
      setState(() {
      activeScreen = Result(selectedAns, restart);
        });
    }
  }

  void restart(){
      selectedAns =[];
      setState(() {
      activeScreen = HomeBody(switchScreen);
        
      });
  }

@override
  void initState() {
    activeScreen = HomeBody(switchScreen);
    super.initState();
  }

void switchScreen (){
  setState(() {
    activeScreen = QuestionsPage(chosenAnswers);
  });
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient:LinearGradient(colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent
              ])
            ),
             child: activeScreen),
      ),
    );
  }
}
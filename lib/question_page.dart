
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questins.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage(this.onSelectedAns,{super.key});

  final void Function(String) onSelectedAns ;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuesIndex = 0;
  void onAnsQuestion(String answer) {
    widget.onSelectedAns(answer);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
  final currentQues = questions[currentQuesIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQues.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          ),
          ...currentQues.answersShuffeled.map((ans) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: AnswerButton(answerText: ans, onPressed: () => onAnsQuestion(ans)),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/datas/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() onRestart;
  final List<String> choosenAnswer;
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onRestart});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': question[i].text,
        'correct_answer': question[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = question.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question corectly !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'list of Answer and Question',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: Icon(Icons.refresh),
                label: Text('Restart quiz'))
          ],
        ),
      ),
    );
  }
}

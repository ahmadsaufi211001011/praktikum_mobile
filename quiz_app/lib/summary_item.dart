import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: itemData['question_index'] as int),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color: Color.fromARGB(
                    255,
                    202,
                    171,
                    252,
                  ),
                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: TextStyle(
                  color: Color.fromARGB(
                    255,
                    181,
                    254,
                    246,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ))
        ],
      ),
    );
  }
}

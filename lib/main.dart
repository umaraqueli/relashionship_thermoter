import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Questionnaire(),
    );
  }
}

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int currentQuestion = 0;
  bool answer = false;
  bool showVerdict = false;
  List<bool> thermometerParts = List.generate(10, (index) => false);

  String getQuestionText(int questionNumber) {
    switch (questionNumber) {
      case 0:
        return 'Pergunta $questionNumber: Você gosta de programar?';
      case 1:
        return 'Pergunta $questionNumber: Qual é a sua linguagem de programação favorita?';
      default:
        return 'Pergunta $questionNumber: Pergunta genérica';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire App'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                for (int i = 0; i < thermometerParts.length; i++)
                  Row(
                    children: [
                      Image(
                        image: AssetImage(thermometerParts[i]
                            ? 'assets/red.jpg'
                            : 'assets/blue.jpg'),
                        height: 40,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                showVerdict
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Veredito Final:'),
                          Text(answer
                              ? 'Relacionamento Abusivo'
                              : 'Relacionamento Saudável'),
                        ],
                      )
                    : Column(
                        children: [
                          Text(getQuestionText(currentQuestion)),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                answerQuestion(true);
                              });
                            },
                            child: Text('Sim'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                answerQuestion(false);
                              });
                            },
                            child: Text('Não'),
                          ),
                        ],
                      ),
              ],
            ),
          ]),
        ));
  }

  void answerQuestion(bool userAnswer) {
    setState(() {
      answer = userAnswer;
      thermometerParts[currentQuestion] = userAnswer;
      currentQuestion++;
      if (currentQuestion == 10) {
        showVerdict = true;
      }
    });
  }
}

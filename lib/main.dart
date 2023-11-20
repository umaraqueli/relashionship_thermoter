import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Classe principal que representa o aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Questionnaire(), // Define o Questionnaire como a tela inicial
    );
  }
}

// Widget de questionário que mantém o estado
class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int currentQuestion = 0; // Número da pergunta atual
  bool answer = false; // Resposta do usuário (true para Sim, false para Não)
  bool showVerdict = false; // Flag para mostrar o veredito final
  List<String> thermometerParts = [
    'assets/00.png',
    'assets/01.png',
    'assets/02.png', // Imagem do início do termômetro
    'assets/03.png',
    'assets/04.png',
    'assets/05.png',
    'assets/06.png',
    'assets/07.png',
    'assets/08.png',
    'assets/09.png',
    'assets/10.png',
    'assets/11.png',
    'assets/12.png',
    'assets/13.png',
    'assets/14.png',
    'assets/15.png',
    'assets/16.png',
    'assets/17.png',
    'assets/18.png',
    'assets/19.png',
    'assets/20.png',

    // Substitua pelos URLs ou caminhos reais das imagens
    // Adicione mais imagens conforme necessário
  ]; // Lista de caminhos para as partes do termômetro

  // Função para lidar com as respostas do usuário
  void answerQuestion(bool userAnswer) {
    setState(() {
      answer = userAnswer; // Atualiza a resposta do usuário
      currentQuestion++; // Move para a próxima pergunta
      if (currentQuestion == thermometerParts.length) {
        showVerdict =
            true; // Se todas as perguntas foram respondidas, exibe o veredito final
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire App'),
      ),
      body: Center(
        child: showVerdict
            ? VerdictWidget(answer: answer, thermometerParts: thermometerParts)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  answer
                      ? ThermometerWidget(
                          imagePath: thermometerParts[currentQuestion])
                      : ThermometerWidget(
                          imagePath: thermometerParts[
                              currentQuestion != 0 ? currentQuestion - 1 : 0]),
                  SizedBox(width: 20), // Espaço entre o termômetro e a pergunta
                  QuestionWidget(
                    questionNumber: currentQuestion + 1,
                    onAnswer: answerQuestion,
                  ),
                ],
              ),
      ),
    );
  }
}

// Widget para exibir a imagem do termômetro
class ThermometerWidget extends StatelessWidget {
  final String imagePath;

  ThermometerWidget({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      height: 600,
      width: 100,
    );
  }
}

// Widget para exibir uma pergunta
class QuestionWidget extends StatelessWidget {
  final int questionNumber;
  final Function(bool) onAnswer;

  QuestionWidget({required this.questionNumber, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Pergunta $questionNumber: Você concorda?'),
        ElevatedButton(
          onPressed: () => onAnswer(true),
          child: Text('Sim'),
        ),
        ElevatedButton(
          onPressed: () => onAnswer(false),
          child: Text('Não'),
        ),
      ],
    );
  }
}

// Widget para exibir o veredito final
class VerdictWidget extends StatelessWidget {
  final bool answer;
  final List<String> thermometerParts;

  VerdictWidget({required this.answer, required this.thermometerParts});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Veredito Final:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: thermometerParts.map((imagePath) {
            return Image.asset(
              imagePath,
              height: 20,
              width: 10,
            );
          }).toList(),
        ),
        Text(answer ? 'Relacionamento Abusivo' : 'Relacionamento Saudável'),
      ],
    );
  }
}

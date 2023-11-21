import 'package:flutter/material.dart';

void main() {
  runApp(QuestionarioApp());
}

class QuestionarioApp extends StatefulWidget {
  @override
  _QuestionarioAppState createState() => _QuestionarioAppState();
}

class _QuestionarioAppState extends State<QuestionarioApp> {
  int respostaAtual = 0;
  bool resposta = false;
  bool mostrarVeredito = false;
  int imagemAtual = 0;
  bool eRelacionamentoAbusivo = false;

  List<String> partesDoTermometro = [
    'assets/00.png',
    'assets/01.png',
    'assets/02.png',
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
  ];

  respostaDaPergunta(bool respostaUsuario) {
    setState(() {
      resposta = respostaUsuario;
      if (resposta == true) {
        eRelacionamentoAbusivo = true;
        imagemAtual++;
      }
      respostaAtual++;
      if (respostaAtual == 20) {
        mostrarVeredito = true;
      }
    });
  }

  List<String> perguntas = [
    'Pergunta 0: ?',
    'Pergunta 1: ?',
    'Pergunta 2: ?',
    'Pergunta 3: ?',
    'Pergunta 4: ?',
    'Pergunta 5: ?',
    'Pergunta 6: ?',
    'Pergunta 7: ?',
    'Pergunta 8: ?',
    'Pergunta 9: ?',
    'Pergunta 10: ?',
    'Pergunta 11: ?',
    'Pergunta 12: ?',
    'Pergunta 13: ?',
    'Pergunta 14: ?',
    'Pergunta 15: ?',
    'Pergunta 16: ?',
    'Pergunta 17: ?',
    'Pergunta 18: ?',
    'Pergunta 19: ?',
    'Pergunta 20: ?',

    // Adicione as perguntas restantes aqui
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire App'),
        ),
        body: Center(
          child: mostrarVeredito
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      partesDoTermometro[imagemAtual],
                      height: 600,
                      width: 100,
                    ),
                    Text('Veredito Final:'),
                    Text(eRelacionamentoAbusivo
                        ? 'Relacionamento Abusivo'
                        : 'Relacionamento Saudável'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagemAtual <= 20 && imagemAtual != 0
                          ? partesDoTermometro[imagemAtual + 1]
                          : partesDoTermometro[imagemAtual],
                      height: 600,
                      width: 100,
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(perguntas[respostaAtual]),
                        ElevatedButton(
                          onPressed: () => respostaDaPergunta(true),
                          child: Text('Sim'),
                        ),
                        ElevatedButton(
                          onPressed: () => respostaDaPergunta(false),
                          child: Text('Não'),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  double valorPrimeiro = 0.0;
  double valorSegundo = 0.0;
  double valorTotal = 0.0;
  String operacao;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    valorTotal.toString(),
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumerico(7),
                  botaoNumerico(8),
                  botaoNumerico(9),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          operacaoPressionada('/');
                        },
                        color: Colors.blue[900],
                        child: Text(
                          '/',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumerico(4),
                  botaoNumerico(5),
                  botaoNumerico(6),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          operacaoPressionada('X');
                        },
                        color: Colors.blue[900],
                        child: Text(
                          'X',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumerico(1),
                  botaoNumerico(2),
                  botaoNumerico(3),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          operacaoPressionada('-');
                        },
                        color: Colors.blue[900],
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumerico(0),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          operacaoPressionada('+');
                        },
                        color: Colors.blue[900],
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          limparValores();
                        },
                        color: Colors.grey,
                        child: Text(
                          'C',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[900],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: FlatButton(
                        onPressed: () {
                          calcular();
                        },
                        color: Colors.blue[900],
                        child: Text(
                          '=',
                          style: TextStyle(fontSize: 40),
                        ),
                        textColor: Colors.blue[200],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void numeroPressionado(double valorPressionado) {
    if (valorPrimeiro == 0.0) {
      valorPrimeiro = valorPressionado;
    } else {
      valorSegundo = valorPressionado;
    }
  }

  void operacaoPressionada(String operacaoPressionada) {
    operacao = operacaoPressionada;
  }

  void calcular() {
    setState(() {
      if (valorPrimeiro != 0.0 && valorSegundo != 0.0 && operacao != null) {
        if (operacao == '+') {
          valorTotal = valorPrimeiro + valorSegundo;
        }
        if (operacao == '-') {
          valorTotal = valorPrimeiro - valorSegundo;
        }
        if (operacao == 'X') {
          valorTotal = valorPrimeiro * valorSegundo;
        }
        if (operacao == '/') {
          valorTotal = valorPrimeiro / valorSegundo;
        }
      }
    });
  }

  void limparValores() {
    setState(() {
      valorPrimeiro = 0.0;
      valorSegundo = 0.0;
      operacao = null;
      valorTotal = 0.0;
    });
  }

  Expanded botaoNumerico(double valor) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: FlatButton(
          onPressed: () {
            numeroPressionado(valor);
          },
          color: Colors.blue[200],
          child: Text(
            convertToInt(valor),
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          textColor: Colors.blue[900],
        ),
      ),
    );
  }

  Expanded botaoOperacao(String operacao) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: FlatButton(
          onPressed: () {
            operacaoPressionada(operacao);
          },
          color: Colors.blue[900],
          child: Text(
            operacao,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          textColor: Colors.blue[200],
        ),
      ),
    );
  }

  String convertToInt(double numeroDouble) {
    int numeroInteiro = numeroDouble.round();
    return numeroInteiro.toString();
  }
}

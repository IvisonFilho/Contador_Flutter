import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de copos de água",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _copo = 0;
  String _mensagem = "Atinja sua meta!";

  void _changePeople(int delta) {
    setState(() {
      _copo += delta;
      if (_copo >= 8) {
        _mensagem = "Parabéns, você conseguiu. Volte Amanhã!";
        _copo = 8;
      } else if (_copo < 8 && _copo >= 0) {
        _mensagem = "Atinja sua meta!";
      } else {
        _copo = 0;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _copo = 0;
      _mensagem = "Atinja sua meta!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          _copo >= 8 ? "Imagens/Copo_Fim.jpg" : "Imagens/Copo_Inicio.jpeg",
          fit: BoxFit.cover,
          height: 1000.00,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Copos: $_copo",
              style: TextStyle(
                color: Color.fromARGB(255, 71, 69, 69),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: const Color.fromARGB(255, 68, 67, 67),
                      ),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: const Color.fromARGB(255, 68, 67, 67),
                      ),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "Reiniciar",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: const Color.fromARGB(255, 68, 67, 67),
                      ),
                    ),
                    onPressed: () {
                      _resetCounter();
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                color: const Color.fromARGB(255, 68, 67, 67),
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

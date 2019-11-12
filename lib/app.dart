import 'package:flutter/material.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _quantidadeDePessoas = 0;
  String _textoDeInformacao = "Pode Entrar";

  void adicionarPessoa() {
    setState(() {
      _quantidadeDePessoas++;
      verificaQuantidadeDePessoas();
    });
  }

  void diminuirPessoa() {
    setState(() {
      _quantidadeDePessoas--;
      verificaQuantidadeDePessoas();
    });
  }

  void verificaQuantidadeDePessoas() {
    setState(() {
      if (_quantidadeDePessoas < 0)
        _textoDeInformacao = "Mundo invertido?";
      else if (_quantidadeDePessoas > 10)
        _textoDeInformacao = "Lotado!";
      else
        _textoDeInformacao = "Pode Entrar";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/restaurant.jpg',
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pessoas: $_quantidadeDePessoas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: adicionarPessoa,
                      child: Text(
                        '+1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: diminuirPessoa,
                      child: Text(
                        '-1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                '$_textoDeInformacao',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

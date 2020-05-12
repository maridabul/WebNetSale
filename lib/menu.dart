

import 'package:flutter/material.dart';
import 'package:new_try/cadastrar_usuario.dart';
import 'package:new_try/recuperar_usuario.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Menu"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                  child: Text('Cadastrar novo cliente'),
                  onPressed: () => _showCadastrarUsuario(context),
                  
                ),
              ),

              RaisedButton(
                child: Text("Recuperar dados de cliente"),
                onPressed: () => _showRecuperarDadosUsuario(context),
              ),

              // SelectionButton(
              //   text: ,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCadastrarUsuario(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CadastrarNovoUsuario(title: "Cadastrar novo cliente",),
      ),
    );
  }

    void _showRecuperarDadosUsuario(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RecuperarDadosUsuario(),
      ),
    );
  }

}

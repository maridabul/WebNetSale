import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:new_try/cadastrar_usuario.dart';
import 'package:new_try/menu.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cadastrar Novo Cliente',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Menu(),
      //MyHomePage(title: 'Cadastrar Novo Cliente'),
    );
  }
}

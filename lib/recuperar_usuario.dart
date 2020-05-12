import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_try/usuario.dart';

import 'menu.dart';

class RecuperarDadosUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _cpfController = TextEditingController();
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Recuperar dados do cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: _cpfController,
                    decoration: InputDecoration(
                      labelText: 'CPF do cliente',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  onPressed: () async {
                    final int cpf = int.tryParse(_cpfController.text);

                    String dados = await getData(cpf);
                    if (dados != "") {
                      textoConfirmacao(context, "Dados do cliente", dados);
                    }
                    else {
                      textoConfirmacao(context, "Erro", "CPF não cadastrado.");
                    }
                  },
                  child: Text("Procurar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> getData(int cpf) async {
  String dados = "";
  
  await Firestore.instance
      .collection("usuario")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) {
      if (Usuario.fromDoc(f).cpf == cpf) {
        debugPrint(Usuario.fromDoc(f).cpf.toString());
        dados = Usuario.fromDoc(f).toString();
        debugPrint(dados);
      }
    });
  });

  debugPrint("dados: $dados");
  return dados;
}

void textoConfirmacao(context, String status, String mensagem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(status),
        content: Text(mensagem),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu()));
              },
              child: Text("OK")),
        ],
      );
    },
  );
}
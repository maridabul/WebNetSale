
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_try/menu.dart';
import 'package:new_try/usuario.dart';

class CadastrarNovoUsuario extends StatefulWidget {
  CadastrarNovoUsuario({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CadastrarNovoUsuarioState createState() => new _CadastrarNovoUsuarioState();
}

class _CadastrarNovoUsuarioState extends State<CadastrarNovoUsuario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _nascimentoController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  bool telefone = false;
  bool internet = false;
  bool televisao = false;

  @override
  Widget build(BuildContext context) {
    // final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 128.0),
                children: <Widget>[
                  buildTextFormField(
                      _nomeController,
                      'Insira o nome do novo cliente',
                      'Nome',
                      TextInputType.text,
                      null),
                  buildTextFormField(_cpfController, 'Insira o CPF do cliente',
                      'CPF', TextInputType.number, [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ]),
                  buildTextFormField(
                      _nascimentoController,
                      'DDMMAAAA',
                      'Data de Nascimento',
                      TextInputType.datetime,
                      [LengthLimitingTextInputFormatter(10)]),
                  buildTextFormField(
                      _cepController,
                      'Insira o CEP da residência',
                      'CEP',
                      TextInputType.number, [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ]),

//                   buildTextFormField(null, 'Insira o endereço do cliente',
//                       'Endereço', TextInputType.text, null),
//                   Container(
//                     alignment: Alignment.topCenter,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           // margin: const EdgeInsets.only(left: 36.0),
//                           alignment: Alignment.topCenter,
//                           width: halfMediaWidth / 3.0,
//                           child: new TextFormField(
//                             decoration: const InputDecoration(
//                               hintText: 'Insira o numero',
//                               labelText: 'Número',
//                             ),
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               WhitelistingTextInputFormatter.digitsOnly,
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(left: 20.0),
//                           alignment: Alignment.topCenter,
//                           width: halfMediaWidth + 71.0,
//                           child: new TextFormField(
//                             decoration: const InputDecoration(
//                               hintText: 'Insira o complemento do endereço',
//                               labelText: 'Complemento',
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.topCenter,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           // margin: const EdgeInsets.only(left: 36.0),
//                           alignment: Alignment.topCenter,
//                           width: halfMediaWidth * 1.5 - 70,
//                           child: new TextFormField(
//                             decoration: const InputDecoration(
//                               hintText: 'Insira a cidade',
//                               labelText: 'Cidade',
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(left: 20.0),
//                           alignment: Alignment.topCenter,
//                           width: halfMediaWidth * 0.1,
//                           child: new TextFormField(
//                             decoration: const InputDecoration(
//                               hintText: 'UF',
//                               labelText: 'UF',
//                             ),
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(2)
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   buildTextFormField(null, 'Insira o bairro', 'Bairro',
//                       TextInputType.text, null),
//                   buildTextFormField(null, 'Insira um numero de contato',
//                       'Telefone', TextInputType.phone, [
//                     WhitelistingTextInputFormatter.digitsOnly,
//                   ]),
//                   buildTextFormField(null, 'Insira um email de contato',
//                       'Email', TextInputType.emailAddress, null),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: new Material(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.phone),
                              color: Colors.white,
                              onPressed: () => telefone = true,
                            ),
                          ),
                          new Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.tv),
                              color: Colors.white,
                              onPressed: () => televisao = true,
                            ),
                          ),
                          new Ink(
                            decoration: const ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.wifi),
                              color: Colors.white,
                              onPressed: () => internet = true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Cadastrar'),
                        onPressed: () async {
                          debugPrint("cadatro realizado");

                          final String nome = _nomeController.text;
                          final int nascimento =
                              int.tryParse(_nascimentoController.text);
                          final int cep = int.tryParse(_cepController.text);
                          final int cpf = int.tryParse(_cpfController.text);
                          final novoUsuario = Usuario(
                            nome: nome,
                            nascimento: nascimento,
                            cep: cep,
                            cpf: cpf,
                            telefone: telefone,
                            televisao: televisao,
                            internet: internet,
                          );

                          await Firestore.instance
                              .collection("usuario")
                              .add(novoUsuario.toMap());

                          textoConfirmacao(context);
                        },
                      )),
                ],
              ))),
    );
  }

  TextFormField buildTextFormField(
    TextEditingController _controller,
    String hint,
    String label,
    TextInputType keyboardType,
    List<TextInputFormatter> inputFormatters,
  ) {
    return new TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}

void textoConfirmacao(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Novo cliente criado com sucesso"),
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

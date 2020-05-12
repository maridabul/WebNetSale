
import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {

  final String nome;
  final int nascimento;
  final int cep;
  final int cpf;
  bool telefone;
  bool televisao;
  bool internet;
  final String documentId;

  Usuario({
    this.nome,
    this.nascimento,
    this.cep,
    this.cpf,
    this.telefone,
    this.televisao,
    this.internet,
    this.documentId,
  });
  
  
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'nascimento': nascimento,
      'cep': cep,
      'cpf': cpf,
      'telefone': telefone,
      'televisao': televisao,
      'internet': internet,
    };
  }


  static Usuario fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;
  
    return Usuario(
      nome: doc['nome'],
      nascimento: doc['nascimento'],
      cep: doc['cep'],
      cpf: doc['cpf'],
      telefone: doc['telefone'],
      televisao: doc['televisao'],
      internet: doc['internet'],
      documentId: doc.documentID,
    );
  }
  
  @override
  String toString() {
    String dados = 'Nome: $nome, \nNascimento: $nascimento, \nCEP: $cep, \nCPF: $cpf \n Serviços:';

    if (televisao){
      dados = ('$dados \n-Televisão');
    }
    if (internet){
      dados = ('$dados \n-Internet');
    }
    if (telefone){
      dados = ('$dados \n-Telefone');
    }

    return dados;
    
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Usuario &&
      o.nome == nome &&
      o.nascimento == nascimento &&
      o.cep == cep &&
      o.cpf == cpf &&
      o.telefone == telefone &&
      o.televisao == televisao &&
      o.internet == internet;
  }

  @override
  int get hashCode {
    return nome.hashCode ^
      nascimento.hashCode ^
      cep.hashCode ^
      cpf.hashCode ^
      telefone.hashCode ^
      televisao.hashCode ^
      internet.hashCode;
  }
  }

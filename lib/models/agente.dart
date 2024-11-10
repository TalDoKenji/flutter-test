import 'package:flutter/foundation.dart';

class Agente {
  final String idComp;
  final String nome;
  final String icone;
  final String funcao;

  Agente(
      {required this.idComp,
      required this.nome,
      required this.icone,
      required this.funcao});

  factory Agente.fromJson(Map<String, dynamic> json, String idComp) {
    var agente = Agente(
        idComp: idComp,
        nome: json["displayName"],
        icone: json["displayIcon"],
        funcao: json["role"]["displayName"]);
    return agente;
  }

  Map<String, dynamic> toMap() {
    return {
      "displayName": nome,
      "displayIcon": icone,
      "role": {"displayName": funcao}
    };
  }

  @override
  String toString() {
    return idComp ?? "";
  }
}

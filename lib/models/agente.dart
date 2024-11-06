class Agente {
  final String _nome;
  final String _icone;
  final String _funcao;

  Agente({required String nome, required String icone, required String funcao})
      : _nome = nome,
        _icone = icone,
        _funcao = funcao;

  factory Agente.fromJson(dynamic json) {
    return Agente(
        nome: json["displayName"],
        icone: json["displayIcon"],
        funcao: json["role"]["displayName"]);
  }

  String get nome {
    return _nome;
  }

  String get icone {
    return _icone;
  }

  String get funcao {
    return _funcao;
  }
}

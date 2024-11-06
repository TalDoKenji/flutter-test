class Mapa {
  final String _nome;
  final String _icone;
  final String _displayMap;
  final String _coordenadas;

  Mapa(
      {required String nome,
      required String icone,
      required String coordenadas,
      required String displayMap})
      : _nome = nome,
        _icone = icone,
        _coordenadas = coordenadas,
        _displayMap = displayMap;

  String get nome {
    return _nome;
  }

  String get icone {
    return _icone;
  }

  String get coordenadas {
    return _coordenadas;
  }

  String get displayMap {
    return _displayMap;
  }
}

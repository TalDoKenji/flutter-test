import 'package:atividade0909/models/agente.dart';

class Comp {

  final String map;
  final List<Agente> comp;

  Comp({required this.map, required this.comp});

  Map<String, dynamic> toMap() {
    return {"mapName": map, "comp": comp.map((e) => e.toMap()).toList()};
  }

  factory Comp.fromJson(Map<dynamic, dynamic> json, String id) {
    final agentes = json['comp'] as List<dynamic>;
    final teste = agentes.map((e) => Agente.fromJson(e, id)).toList();
    return Comp(map: json["mapName"], comp: teste);
  }

  @override
  String toString() {
    return comp.join(" - ");
  }
}

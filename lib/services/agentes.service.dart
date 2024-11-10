import 'package:atividade0909/models/agente.dart';
import 'package:atividade0909/models/comp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const String valorantUrl = 'https://valorant-api.com/v1';
const String localUrl = 'http://localhost:3000';

abstract interface class IAgenteService {
  Future<List<Agente>> getAgentes();
  Future<void> saveComp(Comp comp);
  Future<List<Comp>> getComps(String mapName);
  Future<void> deleteComp(String idComp);
}

class AgenteService implements IAgenteService {
  @override
  Future<List<Agente>> getAgentes() async {
    final response = await http
        .get(Uri.parse('$valorantUrl/agents?isPlayableCharacter=true'));

    final json = jsonDecode(response.body);
    final data = json['data'] as List;
    final agentList =
        List<Agente>.from(data.map((e) => Agente.fromJson(e, json['id']??'1')));
    return agentList;
  }

  @override
  Future<void> saveComp(Comp comp) async {
    String body = jsonEncode({"data": comp.toMap()});
    await http.post(Uri.parse('$localUrl/comps'), body: body);
  }

  @override
  Future<List<Comp>> getComps(String mapName) async {
    final response = await http.get(Uri.parse('$localUrl/comps'));

    final json = jsonDecode(response.body);
    List<Comp> allComps = [];
    for (var item in json) {
      final data = item['data'];
      final teste = item['data']['mapName'];
      if (mapName == teste) {
        allComps.add(Comp.fromJson(data, item['id']));
      }
    }
    return allComps;
  }

  @override
  Future<void> deleteComp(String idComp) async {
    await http.delete(Uri.parse('$localUrl/comps/$idComp'));
  }
}

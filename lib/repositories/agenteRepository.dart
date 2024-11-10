import 'package:atividade0909/models/agente.dart';

class AgentesReposisory {
  static List<Agente> agentes = [
    Agente(
        idComp: 'abc123',
        nome: 'Gekko',
        icone: 'images/gekko.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'def456',
        nome: 'Omen',
        icone: 'images/Omen.png',
        funcao: 'Controlador'),
    Agente(
        idComp: 'ghi789',
        nome: 'Jett',
        icone: 'images/Jett.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'jkl012',
        nome: 'Sova',
        icone: 'images/sova.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'mno345',
        nome: 'Killjoy',
        icone: 'images/Killjoy.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'pqr678',
        nome: 'Reyna',
        icone: 'images/reyna.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'stu901',
        nome: 'Phoenix',
        icone: 'images/phoenix.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'vwx234',
        nome: 'Yoru',
        icone: 'images/yoru.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'yzb567',
        nome: 'Raze',
        icone: 'images/raze.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'cde890',
        nome: 'Viper',
        icone: 'images/viper.png',
        funcao: 'Controlador'),
    Agente(
        idComp: 'fgh123',
        nome: 'Astra',
        icone: 'images/astra.png',
        funcao: 'Controlador'),
    Agente(
        idComp: 'ijk456',
        nome: 'Breach',
        icone: 'images/breach.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'lmn789',
        nome: 'Cypher',
        icone: 'images/cypher.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'opq012',
        nome: 'Skye',
        icone: 'images/skye.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'rst345',
        nome: 'Iso',
        icone: 'images/iso.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'uvw678',
        nome: 'Vyse',
        icone: 'images/vyse.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'xyz901',
        nome: 'Harbor',
        icone: 'images/harbor.png',
        funcao: 'Controlador'),
    Agente(
        idComp: 'bcd234',
        nome: 'Deadlock',
        icone: 'images/deadlock.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'efg567',
        nome: 'Sage',
        icone: 'images/sage.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'hij890',
        nome: 'Neon',
        icone: 'images/neon.png',
        funcao: 'Duelista'),
    Agente(
        idComp: 'klm123',
        nome: 'Kayo',
        icone: 'images/kayo.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'nop456',
        nome: 'Fade',
        icone: 'images/fade.png',
        funcao: 'Iniciador'),
    Agente(
        idComp: 'qrs789',
        nome: 'Clove',
        icone: 'images/clove.png',
        funcao: 'Controlador'),
    Agente(
        idComp: 'tuv012',
        nome: 'Chamber',
        icone: 'images/chamber.png',
        funcao: 'Sentinela'),
    Agente(
        idComp: 'wxy345',
        nome: 'Brimstone',
        icone: 'images/brim.png',
        funcao: 'Controlador'),
  ];

  Future<List<Agente>> findAll() async {
    return agentes;
  }

  Future<Iterable<Agente>> findByName(String name) async {
    return agentes
        .where((agente) => agente.nome.toLowerCase().startsWith(name));
  }
}

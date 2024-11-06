import 'package:atividade0909/models/agente.dart';

class AgentesReposisory {
  static List<Agente> agentes = [
    Agente(nome: 'Gekko', icone: 'images/gekko.png', funcao: 'Iniciador'),
    Agente(nome: 'Omen', icone: 'images/Omen.png', funcao: 'Controlador'),
    Agente(nome: 'Jett', icone: 'images/Jett.png', funcao: 'Duelista'),
    Agente(nome: 'Sova', icone: 'images/sova.png', funcao: 'Iniciador'),
    Agente(nome: 'Killjoy', icone: 'images/Killjoy.png', funcao: 'Sentinela'),
    Agente(nome: 'Reyna', icone: 'images/reyna.png', funcao: 'Duelista'),
    Agente(nome: 'Phoenix', icone: 'images/phoenix.png', funcao: 'Duelista'),
    Agente(nome: 'Yoru', icone: 'images/yoru.png', funcao: 'Duelista'),
    Agente(nome: 'Raze', icone: 'images/raze.png', funcao: 'Duelista'),
    Agente(nome: 'Viper', icone: 'images/viper.png', funcao: 'Controlador'),
    Agente(nome: 'Astra', icone: 'images/astra.png', funcao: 'Controlador'),
    Agente(nome: 'Breach', icone: 'images/breach.png', funcao: 'Iniciador'),
    Agente(nome: 'Cypher', icone: 'images/cypher.png', funcao: 'Sentinela'),
    Agente(nome: 'Skye', icone: 'images/skye.png', funcao: 'Iniciador'),
    Agente(nome: 'Iso', icone: 'images/iso.png', funcao: 'Duelista'),
    Agente(nome: 'Vyse', icone: 'images/vyse.png', funcao: 'Sentinela'),
    Agente(nome: 'Harbor', icone: 'images/harbor.png', funcao: 'Controlador'),
    Agente(nome: 'Deadlock', icone: 'images/deadlock.png', funcao: 'Sentinela'),
    Agente(nome: 'Sage', icone: 'images/sage.png', funcao: 'Sentinela'),
    Agente(nome: 'Neon', icone: 'images/neon.png', funcao: 'Duelista'),
    Agente(nome: 'Kayo', icone: 'images/kayo.png', funcao: 'Iniciador'),
    Agente(nome: 'Fade', icone: 'images/fade.png', funcao: 'Iniciador'),
    Agente(nome: 'Clove', icone: 'images/clove.png', funcao: 'Controlador'),
    Agente(nome: 'Chamber', icone: 'images/chamber.png', funcao: 'Sentinela'),
    Agente(nome: 'Brimstone', icone: 'images/brim.png', funcao: 'Controlador'),
  ];

  Future<List<Agente>> findAll() async {
    return agentes;
  }

  Future<Iterable<Agente>> findByName(String name) async {
    return agentes
        .where((agente) => agente.nome.toLowerCase().startsWith(name));
  }
}

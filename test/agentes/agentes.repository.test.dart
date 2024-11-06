import 'package:atividade0909/models/agente.dart';
import '../repositories/agenteRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AgentesReposisory>()])
void main() {
  late AgentesReposisory agentesReposisory;

  setUp(() {
    agentesReposisory = AgentesReposisory();

    Agente agente =
        Agente(nome: 'Jett', icone: 'images/Jett.png', funcao: 'Duelista');
    when(agentesReposisory.findAll()).thenAnswer((_) async => [agente]);
  });

  test('deve retornar dados da pessoa usuária ao chamar fetchUser', () async {
    final Agente result = (await agentesReposisory.findByName("Jett")) as Agente;
    expect(result.funcao, 'Duelista');
    expect(result.nome, 'Jett');
  });
}

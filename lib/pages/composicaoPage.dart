import 'package:atividade0909/models/agente.dart';
import 'package:atividade0909/repositories/agenteRepository.dart';
import 'package:flutter/material.dart';
import 'package:atividade0909/services/agentes.service.dart';

class Composicaopage extends StatefulWidget {
  const Composicaopage();

  @override
  State<Composicaopage> createState() => ComposicaoPage();
}

class ComposicaoPage extends State<Composicaopage> {
  List<Agente> selectedagentes = [];
  List<Agente> foundAgentes = [];
  List<Agente> allAgentes = AgentesReposisory.agentes;
  final IAgenteService agenteService = AgenteService();

  @override
  initState() {
    _initAgentes();
    super.initState();
  }

  Future<void> _initAgentes() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      foundAgentes = await agenteService.getAgentes();
    });
    setState(() {});
  }

  void filterAgentes(String input) {
    List<Agente> results = [];

    if (input.isEmpty) {
      results = allAgentes;
    } else {
      results = allAgentes
          .where((agente) =>
              agente.nome.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    }
    setState(() {
      foundAgentes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agentes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => filterAgentes(value),
              decoration: const InputDecoration(
                labelText: 'Busca',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foundAgentes.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(foundAgentes[index].toString()),
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Image.network(foundAgentes[index].icone),
                    title: Text(foundAgentes[index].nome),
                    subtitle: Text(foundAgentes[index].funcao),
                    selected: selectedagentes.contains(foundAgentes[index]),
                    selectedColor: Colors.amber,
                    onLongPress: () {
                      setState(() {
                        (selectedagentes.contains(foundAgentes[index]))
                            ? selectedagentes.remove(foundAgentes[index])
                            : selectedagentes.length < 5
                                ? selectedagentes.add(foundAgentes[index])
                                : selectedagentes;
                      });
                      print(selectedagentes);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, selectedagentes);
          print('voltou');
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}

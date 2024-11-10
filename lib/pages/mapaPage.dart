import 'package:atividade0909/models/agente.dart';
import 'package:atividade0909/models/comp.dart';
import 'package:atividade0909/models/mapa.dart';
import 'package:atividade0909/pages/composicaoPage.dart';
import 'package:atividade0909/services/agentes.service.dart';
import 'package:flutter/material.dart';

class MapaPage extends StatefulWidget {
  final Mapa mapa;

  const MapaPage(this.mapa, {super.key});

  @override
  State<MapaPage> createState() => _MapaPageStates();
}

class _MapaPageStates extends State<MapaPage> {
  List<Agente> _selectedAgentes = [];
  List<List<Agente>> listComps = [];
  final IAgenteService agenteService = AgenteService();

  @override
  initState() {
    _initComps();
    super.initState();
  }

  Future<void> _constroiSelectAgentes() async {
    final List<Agente>? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Composicaopage()));
    if (result != null) {
      setState(() {
        agenteService.getComps(widget.mapa.nome);
        _selectedAgentes = result;
        listComps.add(result);
      });
    }
    if (_selectedAgentes.isNotEmpty) {
      await agenteService
          .saveComp(Comp(map: widget.mapa.nome, comp: _selectedAgentes));
    }
  }

  Future<void> _initComps() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      final list = await agenteService.getComps(widget.mapa.nome);
      for (var comp in list) {
        listComps.add(comp.comp);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.mapa.icone), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.mapa.nome),
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _constroiSelectAgentes();
                  },
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(const Size(80, 40)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  child: const Text('Criar composição'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.separated(
                      itemCount: listComps.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[300],
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            onLongPress: () {
                              _showDialogDelete(listComps[index][0].idComp);
                            },
                            title: Row(
                              children: listComps[index]
                                  .map((agente) => Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.network(
                                          agente.icone,
                                          height: 50,
                                          width: 45,
                                          fit: BoxFit.cover,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _showDialogDelete(String? idComp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Item'),
          content:
              const Text('Tem certeza de que deseja excluir esta composição?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: const Text('Excluir'),
              onPressed: () async {
                await agenteService.deleteComp(
                    idComp ?? "pipi"); // Chama a função para remover o item
                Navigator.of(context).pop(); // Fecha o diálogo
                setState(() {
                  listComps.removeWhere((comp) => comp[0].idComp == idComp);
                });
              },
            ),
          ],
        );
      },
    );
  }
}

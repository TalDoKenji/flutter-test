import 'package:atividade0909/models/agente.dart';
import 'package:atividade0909/models/mapa.dart';
import 'package:atividade0909/pages/composicaoPage.dart';
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

  Future<void> _constroiSelectAgentes() async {
    final List<Agente>? result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Composicaopage()));
    if (result != null) {
      setState(() {
        _selectedAgentes = result;
        listComps.add(result);
      });
    }
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
            height: 300,
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
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: listComps[index]
                                .map((agente) => Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image.asset(
                                        agente.icone,
                                        height: 50,
                                        width: 56,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                .toList(),
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
}


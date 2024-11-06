import 'package:atividade0909/pages/mapaPage.dart';
import 'package:atividade0909/repositories/mapaRepository.dart';
import 'package:flutter/material.dart';

class ListMapasPage extends StatelessWidget {
  const ListMapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapas = MapaRepository.mapas;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapas'),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int mapa) {
            return ListTile(
              leading: Image.asset(mapas[mapa].icone),
              title: Text(mapas[mapa].nome),
              trailing: Text(mapas[mapa].coordenadas),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapaPage(mapas[mapa])));
              },
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: mapas.length,
        ));
  }
}

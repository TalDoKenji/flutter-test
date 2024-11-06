// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:atividade0909/pages/ListmapasPage.dart';
import 'package:atividade0909/pages/mapaPage.dart';
import 'package:atividade0909/repositories/agenteRepository.dart';
import 'package:atividade0909/repositories/mapaRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'repositories/widget/listMapWidget.dart';

void main() {
  testWidgets('Teste de incremento do contador', (WidgetTester tester) async {
    // Constrói o widget e o insere na árvore de widgets.
    await tester.pumpWidget(MyApp());

    // Verifica se o texto inicial está correto.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Simula o toque no botão de incremento.
    await tester.tap(find.byIcon(Icons.add));

    // Rebuild the widget after the state has changed.
    await tester.pump();

    // Verifica se o contador foi incrementado.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  group('testando app', () {
    test('testa quantidade de agentes', () async {
      var agentes = AgentesReposisory();
      var allAgentes = await agentes.findAll();
      expect(allAgentes.length, 25);
    });

    test('testa busca por nome com nome completo', () async {
      var agentes = AgentesReposisory();
      var foundAgente = await agentes.findByName('sova');
      expect(foundAgente.first.nome.toLowerCase(), 'Sova');
    });

    // test('testando filtro de agentes', () {
    //   var nomeAgente = "sova";
    //   agentes.filterAgentes(nomeAgente);
    //   expect(agentes.foundAgentes.length, 1);
    // });
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    title: 'Mapas',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
  await tester.pump();
}

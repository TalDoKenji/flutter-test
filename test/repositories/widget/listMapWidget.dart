import 'package:atividade0909/pages/mapaPage.dart';
import 'package:atividade0909/repositories/mapaRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(MaterialApp(
    title: 'Mapas',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
  await tester.pump();
}

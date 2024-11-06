import 'package:atividade0909/pages/ListmapasPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Colors.indigo
        )
      ),
      home: const ListMapasPage(),
    );
  }
}

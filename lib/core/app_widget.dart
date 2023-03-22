import 'package:consumo_api/pages/home/exemplo_responsividade/lista_responsiva_exemplo.dart';
import 'package:consumo_api/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ListaResponsivaExemplo(),
      home: const HomePage(),
    );
  }
}
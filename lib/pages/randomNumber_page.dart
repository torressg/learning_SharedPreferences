import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int? numeroAleatorio = 0;
  final String CHAVE_NUMERO_ALEATORIO = "numero_random";
  late SharedPreferences storage;

  _RandomNumbersPageState() {
    // Construtor assíncrono
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    storage = await SharedPreferences.getInstance();
    carregarDados();
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      numeroAleatorio = storage.getInt(CHAVE_NUMERO_ALEATORIO);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de números aleatórios"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numeroAleatorio.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var random = Random();
          setState(() {
            numeroAleatorio = random.nextInt(100);
          });
          storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroAleatorio!);
        },
      ),
    ));
  }
}

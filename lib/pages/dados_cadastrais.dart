// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:learning_shared_preference/repositories/linguagens_repository.dart';
import 'package:learning_shared_preference/repositories/nivel_repository.dart';

class DadosCadPage extends StatefulWidget {
  final String texto;
  final List<String> dados;

  const DadosCadPage({super.key, required this.texto, required this.dados});

  @override
  State<DadosCadPage> createState() => _DadosCadPageState();
}

class _DadosCadPageState extends State<DadosCadPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascController = TextEditingController(text: "");
  DateTime? dataNascimento;
  String nivelExp = "";
  double pretencaoSalarial = 0;
  int tempoExp = 0;

  List lingUtilizadas = [];
  var niveis = [];
  var linguagens = [];

  bool salvando = false;

  @override
  void initState() {
    niveis = NivelRepository().retornaNiveis();
    linguagens = LingRepository().retornaLing();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int qtdMax) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i < qtdMax; i++) {
      itens.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }
    return itens;
  }

  Widget returnText(String texto) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.texto),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  returnText("Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  returnText("Data de Nascimento"),
                  TextField(
                    controller: dataNascController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 10, 23));
                      if (data != null) {
                        setState(() {
                          dataNascimento = data;
                          dataNascController.text = dataNascimento.toString();
                        });
                      }
                    },
                  ),
                  returnText("Nível de Experiência"),
                  Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              selected: nivelExp == nivel,
                              title: Text(nivel.toString()),
                              value: nivel.toString(),
                              groupValue: nivelExp,
                              onChanged: (value) {
                                setState(() {
                                  nivelExp = value.toString();
                                });
                                print(nivelExp);
                              }))
                          .toList()),
                  returnText("Linguagens utilizadas"),
                  Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              value: lingUtilizadas.contains(linguagem),
                              onChanged: (value) {
                                if (value!) {
                                  setState(() {
                                    lingUtilizadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    lingUtilizadas.remove(linguagem);
                                  });
                                }
                                setState(() {});
                              }))
                          .toList()),
                  returnText("Pretenção Salarial"),
                  Text(
                    "R\$ ${pretencaoSalarial.round()}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: pretencaoSalarial,
                      onChanged: (double value) {
                        setState(() {
                          pretencaoSalarial = value;
                        });
                      }),
                  returnText("Tempo de experiência"),
                  DropdownButton(
                      value: tempoExp,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExp = int.parse(value.toString());
                        });
                      }),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        salvando = true;
                      });

                      Future.delayed(
                          const Duration(seconds: 2),
                          () => {
                                setState(() {
                                  salvando = false;
                                }),
                                Navigator.pop(context)
                              });

                      print(nomeController.text);
                      print(dataNascimento);
                    },
                    child: const Text("Salvar"),
                  )
                ],
              ),
      ),
    );
  }
}

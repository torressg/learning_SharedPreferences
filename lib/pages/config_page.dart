import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  late SharedPreferences storage;

  String? nomeUsuario;
  double? emailUsuario;
  bool receberNotif = false;
  bool darkMode = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_EMAIL_USUARIO = "CHAVE_EMAIL_USUARIO";
  final CHAVE_RECEBER_NOTIF = "CHAVE_RECEBER_NOTIF";
  final CHAVE_DARK_MODE = "CHAVE_DARK_MODE";

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController emailUsuarioController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      emailUsuarioController.text =
          storage.getString(CHAVE_EMAIL_USUARIO) ?? "";
      receberNotif = storage.getBool(CHAVE_RECEBER_NOTIF) ?? false;
      darkMode = storage.getBool(CHAVE_DARK_MODE) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Container(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: nomeUsuarioController,
              decoration: InputDecoration(hintText: "Nome usuário"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: emailUsuarioController,
              decoration: InputDecoration(hintText: "E-mail usuário"),
            ),
          ),
          SwitchListTile(
            title: Text("Receber notificações?"),
            value: receberNotif,
            onChanged: (value) {
              setState(() {
                receberNotif = !receberNotif;
              });
            },
          ),
          SwitchListTile(
            title: Text("Tema escuro"),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
              });
            },
          ),
          TextButton(
              onPressed: () async {
                await storage.setString(
                    CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                await storage.setString(
                    CHAVE_EMAIL_USUARIO, emailUsuarioController.text);
                await storage.setBool(CHAVE_RECEBER_NOTIF, receberNotif);
                await storage.setBool(CHAVE_DARK_MODE, darkMode);
                Navigator.pop(context);
              },
              child: Text("Salvar"))
        ]),
      ),
    ));
  }
}

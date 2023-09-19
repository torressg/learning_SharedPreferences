import 'package:flutter/material.dart';
import 'package:learning_shared_preference/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  context: context,
                  builder: (BuildContext bc) {
                    return const Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Camera"),
                        ),
                        ListTile(
                          leading: Icon(Icons.photo),
                          title: Text("Galeria"),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[300]),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blue[600],
                  child: Image.network(
                      "https://static.wikia.nocookie.net/powerpuff/images/d/df/Macaco_louco.png/revision/latest?cb=20120217214954&path-prefix=pt-br"),
                ),
                accountName: const Text("Macaco Loouco"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text('Dados de cadastro'),
                ],
              ),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadPage(
                          texto: "Meus dados",
                          dados: ["Nome", "Data de Nascimento"])))
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.book),
                  SizedBox(width: 10),
                  Text('Termos de uso e privacidade'),
                ],
              ),
            ),
            onTap: () => {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  context: context,
                  builder: (BuildContext buildContext) {
                    return const SingleChildScrollView(
                      child: Wrap(
                        children: [
                          ListTile(
                            title: Column(
                              children: [
                                Text(
                                  "Temos de uso e privacidade",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Ao contrário do que se acredita, Lorem Ipsum não é simplesmente um texto randômico. Com mais de 2000 anos, suas raízes podem ser encontradas em uma obra de literatura latina clássica datada de 45 AC. Richard McClintock, um professor de latim do Hampden-Sydney College na Virginia, pesquisou uma das mais obscuras palavras em latim, consectetur, oriunda de uma passagem de Lorem Ipsum, e, procurando por entre citações da palavra na literatura clássica, descobriu a sua indubitável origem. Lorem Ipsum vem das seções 1.10.32 e 1.10.33 do "de Finibus Bonorum et Malorum" (Os Extremos do Bem e do Mal), de Cícero, escrito em 45 AC. Este livro é um tratado de teoria da ética muito popular na época da Renascença. A primeira linha de Lorem Ipsum, "Lorem Ipsum dolor sit amet..." vem de uma linha na seção 1.10.32.O trecho padrão original de Lorem Ipsum, usado desde o século XVI, está reproduzido abaixo para os interessados. Seções 1.10.32 e 1.10.33 de "de Finibus Bonorum et Malorum" de Cicero também foram reproduzidas abaixo em sua forma exata original, acompanhada das versões para o inglês da tradução feita por H. Rackham em 1914.',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
            },
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.directions_car_filled_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Configurações'),
                ],
              ),
            ),
            onTap: () => {},
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Sair'),
                ],
              ),
            ),
            onTap: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext buildContext) {
                    return AlertDialog(
                      title: const Text(
                        "Você deseja sair?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Ao sair, o que não foi salvo será perdido.")
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                      ],
                    );
                  })
            },
          ),
        ],
      ),
    );
  }
}

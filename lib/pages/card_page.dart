import 'package:flutter/material.dart';
import 'package:learning_shared_preference/pages/card_detail.dart';
import 'package:learning_shared_preference/model/card_detail.dart';
import 'package:learning_shared_preference/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: cardDetail == null
              ? LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Card(
                    elevation: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(cardDetail!.title),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CardDetailPage(
                                                    cardDetail: cardDetail!,
                                                  )));
                                    },
                                    child: const Text("Ler Mais"))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

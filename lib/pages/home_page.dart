import 'package:flutter/material.dart';
import 'package:learning_shared_preference/pages/card_page.dart';
import 'package:learning_shared_preference/pages/image_assets.dart';
import 'package:learning_shared_preference/pages/list_view_h.dart';
import 'package:learning_shared_preference/pages/list_view_v.dart';
import 'package:learning_shared_preference/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Testes")),
        drawer: const CustomDrawer(),
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              posicaoPagina = value;
            });
          },
          children: [
            const CardPage(),
            const ImageAssetsPage(),
            const ListViewV(),
            const ListViewH()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              controller.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const [
              BottomNavigationBarItem(
                  label: "Artigos", icon: Icon(Icons.article_outlined)),
              BottomNavigationBarItem(
                  label: "ListViewV", icon: Icon(Icons.image)),
              BottomNavigationBarItem(
                  label: "SimApp", icon: Icon(Icons.message_outlined)),
              BottomNavigationBarItem(
                  label: "ListViewH", icon: Icon(Icons.home)),
            ]),
      ),
    );
  }
}

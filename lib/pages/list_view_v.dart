import 'package:flutter/material.dart';
import 'package:learning_shared_preference/shared/app_images.dart';

class ListViewV extends StatefulWidget {
  const ListViewV({super.key});

  @override
  State<ListViewV> createState() => _ListViewVState();
}

class _ListViewVState extends State<ListViewV> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: Text("Gilberto"),
          subtitle: Text("Esse sou eu"),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {},
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: "menu1", child: Text("Opção 1")),
                PopupMenuItem<String>(value: "menu2", child: Text("Opção 2")),
                PopupMenuItem<String>(value: "menu2", child: Text("Opção 3")),
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2)
      ],
    );
  }
}

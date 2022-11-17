import 'package:bach/services/constant.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(myUtilisateur.avatar!),
        ),
        const SizedBox(height: 20),
        Text(myUtilisateur.mail),

        Text(myUtilisateur.nom),
        Text(myUtilisateur.prenom)
      ],
    );
  }
}

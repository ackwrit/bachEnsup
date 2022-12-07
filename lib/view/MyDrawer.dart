import 'dart:typed_data';

import 'package:bach/services/constant.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  //variables
  String? nameImage;
  String? urlImage;
  Uint8List? bytesImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),

        InkWell(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(myUtilisateur.avatar!),
          ),
          onTap: (){
            pickerImage();
          },
        ),
        const SizedBox(height: 20),
        Text(myUtilisateur.mail),

        Text(myUtilisateur.nom),
        Text(myUtilisateur.prenom)
      ],
    );
  }


  pickerImage(){

  }
}

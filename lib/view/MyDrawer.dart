import 'dart:typed_data';
import 'package:bach/services/FirestoreHelper.dart';
import 'package:bach/services/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
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




  pickerImage() async{
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if(resultat != null){
      nameImage = resultat.files.first.name;
      bytesImage = resultat.files.first.bytes;
      //Lancer une boite dialogue
      MyDialogPhotos();
    }



  }

  MyDialogPhotos(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: const Text("Voulez-vous enregistrer cette image ?"),
              content: Image.memory(bytesImage!),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Annulation")
                ),
                TextButton(
                    onPressed: () async{
                      //Stocker notre image
                      urlImage = await FirestoreHelper().storagePicture(nameImage!, bytesImage!);
                      setState(() {
                        //mise à jour de la constante myUtilisateur
                        myUtilisateur.avatar=urlImage;
                      });
                      //Mise à jour des infos dans la BDD
                      Map<String,dynamic> map = {
                        "AVATAR":urlImage
                      };

                      FirestoreHelper().updateUser(myUtilisateur.id, map);
                      Navigator.pop(context);
                    },
                    child: const Text("Validation")
                )

              ],

            );

          }
          else
          {
            return AlertDialog(
              title: const Text("Voulez-vous enregistrer cette image ?"),
              content: Image.memory(bytesImage!),
              actions: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("Annulation")
                ),
                TextButton(
                    onPressed: () async{
                      //Stocker notre image
                      urlImage = await FirestoreHelper().storagePicture(nameImage!, bytesImage!);
                      setState(() {
                        //mise à jour de la constante myUtilisateur
                        myUtilisateur.avatar=urlImage;
                      });
                      //Mise à jour des infos dans la BDD
                      Map<String,dynamic> map = {
                        "AVATAR":urlImage
                      };

                      FirestoreHelper().updateUser(myUtilisateur.id, map);
                      Navigator.pop(context);
                    },
                    child: const Text("Validation")
                )

              ],

            );

          }
        }
    );
  }


}

import 'dart:math';
import 'dart:typed_data';

import 'package:bach/controller/publicationController.dart';
import 'package:bach/services/FirestoreHelper.dart';
import 'package:bach/services/constant.dart';
import 'package:bach/view/MyDrawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_string/random_string.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //variable
  int indexPage = 0;
  PageController pageController = PageController(initialPage: 0);
  String? photos;
  String? videos;
  String texte ="";
  Uint8List? bytesDatas;
  String? cheminDatas;
  String? nomDatas;








  //fonction

  _FilePicker(bool isPhoto) async {
      FilePickerResult? resultat = await FilePicker.platform.pickFiles(
        type: (isPhoto)?FileType.image:FileType.video,
        withData: true
      );
      if(resultat != null){
        bytesDatas = resultat.files.first.bytes;
        nomDatas = resultat.files.first.name;
        cheminDatas = await FirestoreHelper().storagePicture(nameImage: nomDatas!, dataImage: bytesDatas!,isPhoto: isPhoto);
        if(isPhoto){
          photos = cheminDatas!;
        }
        else
          {
            videos = cheminDatas!;
          }


      }


  }





  _SendPost() async{
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),),
        builder: (context){
          return Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height/1.3,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Tous les élements
                Column(
                  children: [
                    TextField(
                      decoration : const InputDecoration.collapsed(
                          hintText:"Entrer votre message"

                      ),
                      onChanged: (value){
                        setState(() {
                          texte = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height : 20,
                    ),
                    ElevatedButton.icon(

                        icon : const Icon(Icons.camera),
                        onPressed:(){
                          _FilePicker(false);

                        },
                        label: const Text("Inporter une vidéos")
                    ),
                    const SizedBox(
                      height : 10,
                    ),

                    ElevatedButton.icon(
                        icon : const Icon(Icons.photo),
                        onPressed:(){
                          _FilePicker(true);
                        },
                        label: const Text("Inporter une photos")
                    )
                  ],
                ),
                //






                //Bouton
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: const StadiumBorder(),
                    elevation: 5.0
                  ),
                    onPressed: (){
                    Map<String,dynamic> map = {
                      "PHOTOS" : photos,
                     "VIDEOS" : videos,
                      "TEXTE" : texte,
                      "DATE_POST": DateTime.now(),
                      "LIKES":0,
                     "EMETTEUR": myUtilisateur.toMap(),
                    };


                    String id = randomAlphaNumeric(20);
                    FirestoreHelper().addPost(id, map);
                    Navigator.pop(context);

                    },
                    child: const Text("Validation")
                )
              ],
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.5,
        child: MyDrawer(),
      ),

      appBar: AppBar(

        actions: [
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.squarePlus),
            iconSize: 30,
            onPressed: _SendPost,
          ),
          const SizedBox(width: 10),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.heart),
            iconSize: 30,
            onPressed: (){
              print("Ajouter des favoris") ;
            },
          ),
          const SizedBox(width: 10),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.paperPlane),
            iconSize: 30,
            onPressed: (){

            },
          ),
          const SizedBox(width: 10),
        ],
      ),

      body : bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value){
          setState(() {
            indexPage = value;
            pageController.jumpToPage(value);
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: "Personnes",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_rounded),
            label: "Body",
          ),

        ],
      ),

    );
  }


  Widget bodyPage(){
    return PageView(
      onPageChanged: (value){
        setState(() {
          indexPage = value;
        });
      },
      controller: pageController,
      children: const [
        PublicationController(),
        Center(
          child: Text("deuxième page"),
        ),
        Center(
          child: Text("troisème page"),
        ),
      ],

    );
  }
}

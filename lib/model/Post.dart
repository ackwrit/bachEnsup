


import 'package:bach/model/Utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
  late String id;
  late MyUtilisateur emetteur;
  String? photos;
  String? videos;
  String? text;
  DateTime datePost = DateTime.now();
  late int likes;
  //List<de la classe commentaire>comment


  Post(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    likes = map["LIKES"];
    photos = map["PHOTOS"];
    videos = map["VIDEOS"];
    text = map["TEXTE"];
    Timestamp timestamp = map["DATE_POST"];
    datePost = timestamp.toDate();
    Map<String,dynamic> mapEmmeteur = map["EMETTEUR"];
    Timestamp timpe = mapEmmeteur["BIRTHDAY"];
    emetteur = MyUtilisateur.affection(
        id: mapEmmeteur["ID"],
        prenom: mapEmmeteur["PRENOM"],
        nom: mapEmmeteur["NOM"],
        birthday: timpe.toDate(),
        pseudo: mapEmmeteur["PSEUDO"],
        mail: mapEmmeteur["MAIL"],
      avatar: mapEmmeteur["AVATAR"],
      bio: mapEmmeteur["BIO"]
    );
  }

}
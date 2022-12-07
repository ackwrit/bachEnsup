import 'package:bach/services/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUtilisateur {

  late String id;
  //mail
  late String mail;
  //nom
  late String nom;
  //prenom
  late String prenom;
  //date de naissance
  late DateTime birthday;
  //pseudo
  late String pseudo;
  //sexe
  //late Genre sexe;
  //Avatar
  String? avatar;
  //description bio
  String? bio;



  MyUtilisateur.empty(){
    id ="";
    mail="";
    nom="";
    prenom="";
    pseudo ="";
    birthday= DateTime.now();
    avatar="";
    //sexe = Genre.femme;
    bio = "";
  }

  MyUtilisateur.affection(
      {
        required this.id,
        required this.prenom,
        required this.nom,
        required this.birthday,
        required this.pseudo,
        required this.mail,
        String? this.avatar,
        String? this.bio,
      });


  MyUtilisateur(DocumentSnapshot snapshot){
  id = snapshot.id;
  Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
  mail = map["MAIL"];
  nom = map["NOM"];
  prenom = map["PRENOM"];
  Timestamp timestamp = map["BIRTHDAY"];
  birthday = timestamp.toDate();
  String? optionnelAvatar;
  String? optionnelBio;
  optionnelAvatar = map["AVATAR"];
  optionnelBio = map["BIO"];
  if(optionnelBio == null){
    bio = "";
  }
  else
    {
      bio = optionnelBio;
    }

  if(optionnelAvatar == null){
    avatar = imageDefault;
  }
  else
    {
      avatar = optionnelAvatar;
    }
  String optionnelPseudo= map["PSEUDO"];

  if(optionnelPseudo == null){
    pseudo = "";
  }
  else
  {
    pseudo = optionnelPseudo;
  }

  }

  Map <String,dynamic>toMap(){
    Map<String,dynamic> map = {
     "ID":id,
    "MAIL":mail,
    "NOM":nom,
    "PRENOM":prenom,
    "BIRTHDAY":birthday,
    "AVATAR":avatar,
    "BIO":bio,
      "PSEUDO":pseudo
    };
    return map;
  }


}
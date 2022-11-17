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
    birthday= DateTime.now();
    avatar="";
    //sexe = Genre.femme;
    bio = "";
  }


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




  }


}
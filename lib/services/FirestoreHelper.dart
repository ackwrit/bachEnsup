import 'dart:typed_data';

import 'package:bach/model/Utilisateur.dart';
import 'package:bach/services/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper{
  //Varibales
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;
  final cloudUsers = FirebaseFirestore.instance.collection("UTILISATEURS");
  final cloudPosts = FirebaseFirestore.instance.collection("POSTS");





  //Méthode

  //Inscription
  Future <MyUtilisateur> Inscription({required String mail,required String nom, required String prenom, required String password,required Genre sexe,required DateTime birthday,required String pseudo}) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid = resultat.user!.uid;
    Map<String,dynamic> map = {
      "PRENOM":prenom,
      "NOM":nom,
      "PSEUDO":pseudo,
      //"SEXE":sexe,
      "BIRTHDAY":birthday,
      "MAIL":mail
    };

    addUser(uid,map);
    return getUser(uid);
  }


  Future<MyUtilisateur>Connexion({required String mail, required String password}) async{
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
    String uid = resultat.user!.uid;
    return getUser(uid);
  }

  Future<MyUtilisateur> getUser(String uid) async{
    DocumentSnapshot snapshot = await cloudUsers.doc(uid).get();
    return MyUtilisateur(snapshot);
  }


  addUser(String uid, Map<String,dynamic> map){
    cloudUsers.doc(uid).set(map);
  }

  updateUser(String uid,Map<String,dynamic> map){
    cloudUsers.doc(uid).update(map);
  }

  //Stocker l'image
  Future<String>storagePicture(String nameImage, Uint8List dataImage) async{
    //Stocker l'image dans la bdd
    TaskSnapshot snapshot = await storage.ref("profil/$nameImage").putData(dataImage);
    //récupérer notre url de l'image
    String urlImage = await snapshot.ref.getDownloadURL();
    return urlImage;
  }


  addPost(String id, Map<String,dynamic> map){
    cloudPosts.doc(id).set(map);
  }

  deletePost(String id){
    cloudPosts.doc(id).delete();
  }

  updatePost(String id,String texte){
    Map<String,dynamic> map = {
      "TEXTE":texte
    };
    cloudPosts.doc(id).update(map);
  }

  deleteUser(String uid){
    cloudUsers.doc(uid).delete();
    auth.currentUser!.delete();

  }







}
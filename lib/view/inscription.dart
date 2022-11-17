import 'package:bach/services/FirestoreHelper.dart';
import 'package:bach/services/constant.dart';
import 'package:bach/view/dashboard.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InscriptionState();
  }

}

class InscriptionState extends State<Inscription>{
  //Varibale
  bool isMan = true;
  DateTime birthday = DateTime.now();
  late String mail;
  late String nom;
  late String prenom;
  late String pseudo;
  late String password;
  Genre sexe = Genre.homme;

  //méthode
  Future <void> choiceDate(BuildContext context) async {
      DateTime? pickerDate = await showDatePicker(
          context: context,
          initialDate: birthday,
          firstDate: DateTime(1970),
          lastDate: DateTime.now()
      );
      if(pickerDate!=null && pickerDate!=birthday){
        setState(() {
          birthday = pickerDate!;
        });
      }
  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Inscription"),),
      body: Padding(
        padding: const EdgeInsets.only(top:10,right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [

              //date de naissance


              //Ligne 1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text("Femme"),
                 Switch.adaptive(
                     value: isMan,
                     onChanged: (value){
                       setState(() {
                         isMan = value;
                         if(isMan == true){
                           sexe = Genre.homme;
                         }
                         else
                           {
                             sexe = Genre.femme;
                           }
                       });
                     }
                 ),
                 const Text("Homme")
               ],
              ),
              //Ligne 2
              Row(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: TextField(


                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber,
                        hintText: "Entrer votre adresse mail",


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),


                      ),

                      onChanged: (value){
                        setState(() {
                          mail = value;
                        });

                      },

                    ),
                  ),
                  const SizedBox(width:10),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: TextField(
                      obscureText: true,

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber,
                        hintText: "Entrer votre mot de passe",


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),

                      ),
                      onChanged: (value){
                        setState(() {
                          password = value;
                        });
                      },

                    ),
                  ),

                ],
              ),

              //Ligne 3
              const SizedBox(height:10),
              Row(
                children: [

                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: TextField(


                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber,
                        hintText: "Entrer votre prénom",


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),

                      ),
                      onChanged: (value){
                        setState(() {
                          prenom = value;
                        });
                      },

                    ),
                  ),
                  const SizedBox(width:10),
                  Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    child: TextField(


                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.amber,
                        hintText: "Entrer votre nom",


                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),

                        ),

                      ),

                      onChanged: (value){
                        setState(() {
                          nom = value;
                        });
                      },

                    ),
                  ),

                ],
              ),

              //Ligne 4
              const SizedBox(height:10),
              Container(
                width: double.infinity,
                child: TextField(


                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.amber,
                    hintText: "Entrer votre pseudo",


                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),

                  ),
                  onChanged: (value){
                    setState(() {
                      pseudo = value;
                    });
                  },

                ),
              ),
              const SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Date de naissance : ${birthday.day}/${birthday.month}/${birthday.year}"),
                  IconButton(
                      onPressed: (){
                        choiceDate(context);

                      },
                      icon: const Icon(Icons.access_time_filled)
                  ),



                ],
              ),
              //Ligne 5
              const SizedBox(height:10),
              ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().Inscription(mail: mail, nom: nom, prenom: prenom, password: password, sexe: sexe, birthday: birthday, pseudo: pseudo).then((value){
                      print("J'ai réussi l'inscription");
                      myUtilisateur = value;
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return Dashboard();
                          }
                      ));

                    }).catchError((onError){
                      print("j'ai pas réussi");
                    });

                  },
                  child: const Text("Inscription")
              )





            ],
          ),
        ),
      ),
    );



  }

}
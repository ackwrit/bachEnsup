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

  //méthode
  choiceDate(){

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

                    ),
                  ),
                  SizedBox(width:10),
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

                    ),
                  ),

                ],
              ),

              //Ligne 3
              SizedBox(height:10),
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

                    ),
                  ),
                  SizedBox(width:10),
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

                    ),
                  ),

                ],
              ),

              //Ligne 4
              SizedBox(height:10),
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

                ),
              ),
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Date de naissance : ${birthday.day}/${birthday.month}/${birthday.year}"),
                  IconButton(
                      onPressed: (){
                        choiceDate();

                      },
                      icon: const Icon(Icons.access_time_filled)
                  )
                ],
              ),





            ],
          ),
        ),
      ),
    );



  }

}
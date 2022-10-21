import 'package:flutter/material.dart';
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: Text("Ma première application"),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
          child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Image
                  AnimationDelay(
                      duration: 1000,
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2021/03/04/11/37/coast-6067736_960_720.jpg"),

                      ),
                  ),

                  //pour donner un espacement entre les widgets
                  const SizedBox(height: 10,),

                  //Text descritpion
                  AnimationDelay(
                      duration: 2000,
                      child: const Text("Bienvenue dans votre application de bien-être",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold
                        ),),
                  ),

                  //pour donner un espacement entre les widgets
                  const SizedBox(height: 10,),

                  //Bouton
                  AnimationDelay(
                      duration: 3000,
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context){
                                        return MaDeuxiemePage();
                                      }
                                  ));

                            },
                            child: const Text("Bienvenue")
                        ),
                      )
                  )

                ],
              ),
            ),

        )







        /*Image.asset("src")


        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 60,
        ),



        ElevatedButton(
            onPressed: (){
              print("J'ai appuyé");
            },
            child: const Text("Connexion")
        )

        TextField(
          obscureText: false,
        ),


        Text(
            "Je suis un texte",
          style: TextStyle(
              color: Colors.red,
              fontSize: 50,
              fontWeight: FontWeight.bold
          ),
        ),

        Container(
          height: 200,
          width: 450,
          color: Colors.yellow,
          child: Text("Je suis dans la boite"),
        )*/
   

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


//Deuxieme page


class MaDeuxiemePage extends StatefulWidget{
  String? monPrenom;
  String? monNom;
  MaDeuxiemePage({this.monPrenom,this.monNom});
  @override
  State<StatefulWidget> createState() {

    return MaDeuxiemePageState();
  }

}

class MaDeuxiemePageState extends State<MaDeuxiemePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Je suis dans la deuxième page"),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    // Champs texte pour enter une adresse mail
    //Entrer mot de passe
    //Bounton de connexion
    //Bouton d'inscription
    //Bouton pour les différents réseaux sociaux
    //Google - facebook
    return  Padding(
        padding: const EdgeInsets.only(left:10,right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(

            ),
            TextField(

            ),

            ElevatedButton(
                onPressed: (){

                },
                child: Text("Connexion")
            ),

            TextButton(
                onPressed: (){

                },
                child: Text("Inscription")
            ),


            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                  icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: (){

                  },
                  label: Text("Google")

              ),
            ),



            ElevatedButton(
                onPressed: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("https://cdn.pixabay.com/photo/2016/06/09/20/38/woman-1446557_960_720.jpg",width: 40,height: 40,),
                    SizedBox(width: 10,),
                    Text("Facebook")
                  ],
                )
            )

          ],
        ),
      ),
    );
  }

}


//Petite animation


class AnimationDelay extends StatefulWidget{
  int duration;
  Widget child;
  AnimationDelay({required this.duration,required this.child});
  @override
  State<StatefulWidget> createState() {

    return AnimationDelayState();
  }

}

class AnimationDelayState extends State<AnimationDelay> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 1800)
    );
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animation = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end : Offset.zero,
    ).animate(curvedAnimation);
    Timer(
        Duration(milliseconds: widget.duration),(){
          animationController.forward();
        });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FadeTransition(
      opacity: animationController,
      child: SlideTransition(
        position: animation,
        child: widget.child,
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'dart:async';

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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2021/03/04/11/37/coast-6067736_960_720.jpg"),

                  ),

                  //Text descritpion
                  const Text("Bienvenue dans votre application de bien-être"),

                  //Bouton
                  Container(
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
                ],
              ),
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
    return Text("${widget.monPrenom}");
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
      duration: Duration(milliseconds: 800)
    );
    final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Mon animation");
  }

}

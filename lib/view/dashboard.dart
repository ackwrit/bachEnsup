import 'package:bach/controller/publicationController.dart';
import 'package:bach/view/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //variable
  int indexPage = 0;
  PageController pageController = PageController(initialPage: 0);
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
            onPressed: (){
               print("Ajouter des posts") ;
            },
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
                print("J'envoi un message");
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

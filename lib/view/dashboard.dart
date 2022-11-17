import 'package:bach/view/MyDrawer.dart';
import 'package:flutter/material.dart';


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
      appBar: AppBar(),
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
            icon: Icon(Icons.ac_unit_outlined),
            label: "Personnes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.roundabout_right_sharp),
            label: "Coucou",
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
        Center(
          child: Text("premiere page"),
        ),
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

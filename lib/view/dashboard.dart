import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //variable
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : bodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: (value){
          setState(() {
            indexPage = value;
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
    return Center(
        child: Text("Coucou")
    );
  }
}

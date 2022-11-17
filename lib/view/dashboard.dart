import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : const Text("Je suis connecté"),
      bottomNavigationBar: BottomNavigationBar(
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
}

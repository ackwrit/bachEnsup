import 'package:bach/model/Utilisateur.dart';
import 'package:bach/services/FirestoreHelper.dart';
import 'package:bach/services/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PublicationController extends StatefulWidget {
  const PublicationController({Key? key}) : super(key: key);

  @override
  State<PublicationController> createState() => _PublicationControllerState();
}

class _PublicationControllerState extends State<PublicationController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirestoreHelper().cloudUsers.snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return const CircularProgressIndicator.adaptive();
                }
                else
                  {
                    List documents = snapshot.data!.docs;
                    return Container(
                      width: double.infinity,
                      height: 90,
                      child: ListView.builder(
                        itemCount: documents.length,
                          scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                          itemBuilder: (context,index){
                          MyUtilisateur users = MyUtilisateur(documents[index]);
                          return CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(users.avatar!),

                          );
                        }
                      ),
                    );
                  }
              }
          ),

          //ListView(),
        ],
      ),
    );
  }
}

import 'package:bach/model/Post.dart';
import 'package:bach/model/Utilisateur.dart';
import 'package:bach/services/FirestoreHelper.dart';
import 'package:bach/services/constant.dart';
import 'package:bach/view/my_post_design.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PublicationController extends StatefulWidget {
  const PublicationController({Key? key}) : super(key: key);

  @override
  State<PublicationController> createState() => _PublicationControllerState();
}

class _PublicationControllerState extends State<PublicationController> {
  //Variable
  ScrollController _controller = ScrollController();
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
                    return SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: ListView.builder(


                          padding: const EdgeInsets.only(top :10,left: 0,right: 0,bottom: 10),

                        itemCount: documents.length,
                          scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                          itemBuilder: (context,index){
                          MyUtilisateur users = MyUtilisateur(documents[index]);
                          if(users.id == myUtilisateur.id){
                            return const SizedBox(width: 0,);
                          }
                          else
                            {
                              return Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(users.avatar!),

                                  ),
                                  //Text(users.pseudo)
                                ],
                              );
                            }

                        }
                      ),
                    );
                  }
              }
          ),
          const Divider(height: 2.5,color: Colors.black,),
          StreamBuilder<QuerySnapshot>(
            stream: FirestoreHelper().cloudPosts.orderBy("DATE_POST",descending: true).snapshots(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }
                else
                  {
                    List documents = snapshot.data!.docs;
                    return ListView.builder(
                      controller: _controller,
                      shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (context,index){
                          Post myPost = Post(documents[index]);
                          return MyPostDesign(myPost : myPost);
                        }
                    );
                  }
              }
          )
          // logo à gauche  psuedo
                            //Lieu
          //Image
          //bouton like, message, envoye  --> marqueur de page
          //aimé par

          //mon logo  ajouter un commentaire
          //envoie du message

          //ListView(),
        ],
      ),
    );
  }
}

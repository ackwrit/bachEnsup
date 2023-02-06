import 'package:bach/model/Post.dart';
import 'package:bach/services/constant.dart';
import 'package:flutter/material.dart';

class MyPostDesign extends StatefulWidget {
  Post myPost;
  MyPostDesign({Key? key, required this.myPost}) : super(key: key);

  @override
  State<MyPostDesign> createState() => _MyPostDesignState();
}

class _MyPostDesignState extends State<MyPostDesign> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top :5),
          child: ListTile(
            title: Text(myUtilisateur.pseudo),
          subtitle: Text(widget.myPost.text!),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.myPost.emetteur.avatar!),
          ) ,
            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.password)),

          )
        ),
        (widget.myPost.photos== null)?Container():Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.myPost.photos!),
              fit: BoxFit.fill
            )
          ),
        ),
        Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: 125,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //barre des icones
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){

                          },
                          icon: const Icon(Icons.heart_broken)
                      )
,
                      IconButton(
                          onPressed: (){

                          },
                          icon: const Icon(Icons.chat_bubble_outline_rounded)
                      ),
                      IconButton(
                          onPressed: (){

                          },
                          icon: const Icon(Icons.send)
                      )

                    ],
                  ),

                  IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(Icons.bookmark_border)
                  )
                ],

              ),
            ],
          ),
        ),

        const Divider(),


      ],
    );
  }
}

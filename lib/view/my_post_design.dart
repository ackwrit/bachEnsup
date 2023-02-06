import 'package:bach/model/Post.dart';
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
            padding: const EdgeInsets.all(10),
          child: ListTile(
          title: Text(widget.myPost.text!),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.myPost.emetteur.avatar!),
          ) ,
            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.password)),

          )
          ),

      ],
    );
  }
}

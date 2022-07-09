import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  String names = '';
  String images = '';
  Category({Key? key,
  required this.names,
  required this.images,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
   

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(maxRadius: 30,
            backgroundImage: NetworkImage(widget.images),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.names),
            ),
          ],
        ),
      ),
    );
  }
}

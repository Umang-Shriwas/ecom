import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

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
            backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/108119062?s=400&u=6cf49054d9f37651f7db41efdb8434ffd6d3502d&v=4"),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Category"),
            ),
          ],
        ),
      ),
    );
  }
}

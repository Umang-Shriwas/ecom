import 'package:ecom/Screens/widgets/card.dart';
import 'package:ecom/Screens/widgets/category.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Collections",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          )),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 35,
                ))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Collections",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz_outlined,
                      size: 39,
                    ))
              ],
            ),
            SizedBox(
              height: 110,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => Category(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New In",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: TextStyle(fontSize: 19, color: Colors.black38),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 290,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AdCard(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

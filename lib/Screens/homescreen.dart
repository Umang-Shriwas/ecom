import 'package:ecom/Screens/widgets/card.dart';
import 'package:ecom/Screens/widgets/category.dart';
import 'package:flutter/material.dart';

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
              height: 140,
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
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AdCard(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 70,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {},
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Find Something",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),SizedBox(width: 50,),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: Colors.white,
                        size: 30,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

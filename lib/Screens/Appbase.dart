import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/Screens/home2.dart';
import 'package:ecom/Screens/homescreen.dart';
import 'package:ecom/Screens/widgets/card.dart';
import 'package:ecom/constants/constant.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class Appbase extends StatefulWidget {
  const Appbase({Key? key}) : super(key: key);

  @override
  State<Appbase> createState() => _AppbaseState();
}

class _AppbaseState extends State<Appbase> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Product').snapshots();

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Favourite',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          elevation: 10,
          backgroundColor: AppColor.deepOrange,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              icon: Icon(Icons.forward_outlined)),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return AdCard(
                  name: data['product_name'],
                  price: data['product_price'],
                  description: data["product_description"],
                  image: data["product_image"],
                );
              }).toList(),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: AppColor.deepOrange,
              icon: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.deepOrange,
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.black87,
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.deepOrange,
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black87,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.deepOrange,
              icon: Icon(
                Icons.person_outline,
                color: Colors.black87,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'package:ecom/Screens/widgets/size.dart';
import 'package:ecom/constants/constant.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({Key? key}) : super(key: key);

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Products",
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
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
              left: 300,
              right: 300,
              top: 10,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 270,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://5.imimg.com/data5/CV/FV/DQ/SELLER-8868726/new-latest-design-v-cross-partywear-shirt-500x500.jpg")),
                          ),
                        ),
                        Positioned(
                          child: FavoriteButton(
                            valueChanged: (_isFavorite) {
                              print('Is Favorite $_isFavorite)');
                            },
                          ),
                          top: 10,
                          right: 20,
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text(
                          "Shirt\nSpyke",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,fontSize: 25),
                        ),
                        Text(
                          "Rs.300",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Column(
            children: [SizeListScreen()],),
            SizedBox(height: 10,),
            DefaultTabController(
            length: 4, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: AppColor.deepOrange,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'About'),
                    Tab(text: 'Review'),
                    Tab(text: 'Summary'),
                    Tab(text: 'Comment'),
                  ],
                ),
              ),
              Container(
                height: 200, //height of TabBarView
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                ),
                child: TabBarView(children: <Widget>[
                  Container(
                    color: Colors.cyan[100],
                    child: Center(
                      child: Text('About Product', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    color: Colors.tealAccent,
                    child: Center(
                      child: Text('Review About Product ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    color: Colors.red[100],
                    child: Center(
                      child: Text('Summary Of Product', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    color: Colors.purple[100],
                    child: Center(
                      child: Text('Give your Comment', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ])
              )
            ])
          ),
            
          ],
        ),
      ),
    );
  }
}

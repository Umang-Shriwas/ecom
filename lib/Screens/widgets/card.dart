import 'package:ecom/Screens/productscreen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class AdCard extends StatefulWidget {
  
  String name = '';
  String image = '';
  final price;
  final description;

  AdCard({Key? key,
   required this.name,
   this.price,
   required this.image,
   this.description,
  }) : super(key: key);
  


  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 280,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                            widget.image)),
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
            Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SizedBox(width: 0.005,),
                Column(
                  children: [
                    
                    Text(widget.price),
                    Text(widget.name +"\n" +widget.description),
                  ],
                ),
                FloatingActionButton(
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productscreen(),
                        ),
                      );
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

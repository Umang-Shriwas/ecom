import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class AdCard extends StatefulWidget {
  const AdCard({Key? key}) : super(key: key);

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
                            "https://assets.ajio.com/medias/sys_master/root/20220103/GJKA/61d33a35f997dd66230e9815/-473Wx593H-463599135-blue-MODEL.jpg")),
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
              children: [
                Column(
                  children: [
                    Text("Rs:-1200"),
                    Text("Black shade \nSpyke"),
                  ],
                ),
                FloatingActionButton(
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  onPressed: () {},
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeListScreen extends StatefulWidget {
  const SizeListScreen({Key? key}) : super(key: key);

  @override
  State<SizeListScreen> createState() => _SizeListScreenState();
}

class _SizeListScreenState extends State<SizeListScreen> {
  final List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];
  var currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(
          width: 10,
        ),
        itemCount: sizeList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentSelected = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: currentSelected == index
                    ? Theme.of(context).backgroundColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: Colors.teal, width: 2)),
            child: Text(
              sizeList[index],
              style: TextStyle(
                  color: currentSelected == index
                      ? Theme.of(context).primaryColor
                      : Colors.grey[900],
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
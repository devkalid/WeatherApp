


import 'package:flutter/material.dart';

class CustomListForecaste extends StatelessWidget {
  const CustomListForecaste({super.key});

   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

          CustomCardList(image: "image", tittle: "Temp", value: "40"),
          CustomCardList(image: "image", tittle: "Temp", value: "40"),
          CustomCardList(image: "image", tittle: "Temp", value: "40"),
          CustomCardList(image: "image", tittle: "Temp", value: "40"),
          CustomCardList(image: "image", tittle: "Temp", value: "40"),


      ]),
    );
  }
}




// ignore: must_be_immutable
class CustomCardList extends StatelessWidget {

  String image;
  String tittle;
  String value;

  CustomCardList({required this.image, required this.tittle, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFe2e7fa),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('${image}'), 
            Text("${tittle}"), 
            Text("$value")]),
    );
  }
}

import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {

  final Color cardColor;
  final Widget cardChild;

  const CustomCard({Key? key, required this.cardColor, required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardColor.withOpacity(.4),
      ),
      child: cardChild,
    );
  }
}

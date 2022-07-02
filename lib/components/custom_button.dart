import "package:flutter/material.dart";


class CustomButton extends StatelessWidget {

  final Color color;
  final VoidCallback onPressed;
  final Widget buttonChild;


  const CustomButton({Key? key, required this.color, required this.onPressed, required this.buttonChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)
            ),
            fixedSize: Size(MediaQuery.of(context).size.width*.85,55)
        ),
        onPressed: onPressed, child: buttonChild
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {


  late TextEditingController controller;
  late FocusNode node;
  late TextInputType keyboardType;
  String text;
  TextAlign hintTextAlign;
  bool isObscure;
  TextDirection hintTextDirection;
  EdgeInsets padding;

  CustomTextField({Key? key, required this.controller, required this.node, required this.keyboardType, this.text = "",
  this.hintTextAlign = TextAlign.center,this.isObscure=false,this.hintTextDirection=TextDirection.ltr,this.padding=const EdgeInsets.all(50)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        obscureText: isObscure,
        textAlign: hintTextAlign,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: text,
          hintTextDirection: hintTextDirection,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 4)
          ),
          focusedBorder:const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black,width: 4)
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          hintStyle: const TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
        controller: controller,
        focusNode: node,
        style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      ),
    );
  }
}

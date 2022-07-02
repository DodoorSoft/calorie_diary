import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {


  late TextEditingController controller;
  late FocusNode node;
  late TextInputType keyboardType;

  CustomTextField({Key? key, required this.controller, required this.node, required this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 4)
          ),
          focusedBorder:UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black,width: 4)
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        controller: controller,
        focusNode: node,
        style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class RegisterTile extends StatefulWidget {
  final String labelText;
  final bool textType;
  final TextEditingController editingController;
  const RegisterTile(
      {required this.labelText,
      required this.textType,
      required this.editingController,
      Key? key})
      : super(key: key);

  @override
  State<RegisterTile> createState() => _RegisterTileState();
}

class _RegisterTileState extends State<RegisterTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
                color: const Color.fromARGB(255, 42, 42, 42),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: widget.editingController,
            decoration: InputDecoration(
              hintText: widget.labelText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2, color: Color.fromRGBO(102, 179, 87, 1)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Colors.grey),
              ),
              contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            ),
            style: TextStyle(
                color: const Color.fromARGB(255, 42, 42, 42), fontSize: 12),
            cursorColor: const Color.fromARGB(255, 42, 42, 42),
            obscureText: widget.textType,
          )
        ],
      ),
    );
  }
}

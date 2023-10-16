import 'package:flutter/material.dart';

class Buttonz extends StatefulWidget {
  final String btname;
  final void Function () onPressed;
  const Buttonz({
    super.key,required this.btname,required this.onPressed
  });

  @override
  State<Buttonz> createState() => _ButtonzState();
}

class _ButtonzState extends State<Buttonz> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
          child: Center(
              child: Text(
            widget.btname,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}

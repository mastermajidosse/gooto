import 'package:flutter/material.dart';

class Fasil extends StatelessWidget {
  const Fasil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 22, bottom: 10),
      width: 200,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.black54,
        gradient: LinearGradient(
          colors: [
            Colors.black54,
            Colors.white,
          ],
          begin: Alignment.center,
          end: Alignment.topLeft,
          stops: [
            0,
            1,
          ],
        ),
      ),
    );
  }
}

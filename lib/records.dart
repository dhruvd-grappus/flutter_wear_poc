import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_wear_poc/carousel.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: [
          const BackButton(),
          Flexible(
            child: ListView(
              children: List.generate(
                  100,
                  (index) => const Center(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '43 "',
                          style: TextStyle(fontSize: 30),
                        ),
                      ))),
            ),
          ),
          Transform.rotate(
              angle: pi,
              child: BackButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const CarouselCircle()));
                },
              )),
        ],
      ),
    ));
  }
}

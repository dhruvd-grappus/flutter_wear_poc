import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class CarouselCircle extends StatelessWidget {
  const CarouselCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WatchShape(
        builder: (context, shape, child) {
          return Center(
            child: PageView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),


                ),
                  Container(
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),


                ),
                 Container(
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),


                ),
                 Container(
                  decoration: const BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),


                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

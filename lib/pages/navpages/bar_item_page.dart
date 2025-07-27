import 'package:flutter/material.dart';

import '../../widgets/app_large_text.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: 300,
              height: 800,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/img4.png"), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 35,
            child: Center(
              child: AppLargeText(
                text: "Now you are in the Bar Item Page",
                color: Colors.yellowAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

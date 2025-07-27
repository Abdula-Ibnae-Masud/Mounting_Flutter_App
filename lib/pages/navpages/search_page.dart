import 'package:flutter/material.dart';

import '../../widgets/app_large_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
                      image: AssetImage("img/img7.png"), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 40,
            child: Center(
              child: AppLargeText(
                text: "Now you are in the Search Page",
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}

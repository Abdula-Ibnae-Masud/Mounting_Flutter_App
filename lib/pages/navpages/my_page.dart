import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

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
                      image: AssetImage("img/img2.png"), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 35,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: AppText(
                        text:
                            "Now you are in the Bar Item Page and the owen of this app is 'Abdula Ibnae Masud'.",
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      height: 60,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage("img/me.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

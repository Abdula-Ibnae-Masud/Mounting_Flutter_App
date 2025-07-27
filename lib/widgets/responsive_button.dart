import 'package:flutter/material.dart';

import 'app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 100, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true
            ? double.maxFinite
            : width, // First page button create
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),

        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(text: "Book trip Now"))
                : Container(),
            Image.asset(
              "img/next4.jpg",
              height: 30,
            ), // First page button create from image
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubits.dart';
import '../misc/colors.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img3.png",
    "img8.png",
    "img5.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/${images[index]}"),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "TRIPS",
                          size: 35,
                          color: Colors.amberAccent,
                        ),
                        AppLargeText(
                          text: "Dream Mountains",
                          size: 25,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          // Sizedbox was Container
                          width: 200,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incredible sense of freedom along with endurance test ...",
                            color: Colors.pinkAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: SizedBox(
                              // Sizedbox was Container
                              width: 200,
                              child: Row(children: [
                                ResponsiveButton(
                                  width: 100,
                                )
                              ])),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : Colors.grey,
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

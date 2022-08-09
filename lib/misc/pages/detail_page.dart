// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:travel_app/widget/app_button.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';
import 'package:travel_app/widget/button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int checkedStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("image/welcome-one.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 15,
              left: 15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 35,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Yosemite",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "\$ 250",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.place,
                          size: 15,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "USA, California",
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, ((index) {
                            return Icon(
                              Icons.star,
                              color: index < checkedStar
                                  ? Colors.amber
                                  : Colors.grey,
                            );
                          })),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("(4.0)"),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "People",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Number of people in your group",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(
                        5,
                        ((index) {
                          return InkWell(
                            onTap: (() {
                              setState(() {
                                selectedIndex = index;
                              });
                            }),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                size: 50,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.1),
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : Colors.black.withOpacity(0.1),
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AppLargeText(
                      text: "Description",
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    (AppText(
                      text:
                          "Yosemite national park is located in central siera nevada in the USA of california it is located in a wide protected areas",
                      color: Colors.black.withOpacity(0.2),
                    )),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButton(
                    color: Colors.grey,
                    size: 50,
                    backgroundColor: Colors.blue.withOpacity(0),
                    borderColor: Colors.grey,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

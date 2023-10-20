//Default package imports
import 'package:flutter/material.dart';

//Local file imports
import 'palette.dart';
import 'custom_icons.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // List of page's content
  final List<Map<String, dynamic>> pagesContent = [
    {
      "image": "assets/images/onboard/product_01.png",
      "firstLineText": "Enjoy your",
      "secondLineText": {"regularText": "Life with", "boldText": "Plants"},
    },
    {
      "image": "assets/images/onboard/product_02.png",
      "firstLineText": "Discover",
      "secondLineText": {"regularText": "New", "boldText": "Varieties"},
    },
    {
      "image": "assets/images/onboard/product_03.png",
      "firstLineText": "Create a",
      "secondLineText": {"regularText": "Green", "boldText": "Oasis"},
    }
  ];

  //Current page index
  int currentPageIndex = 0;
  final PageController _imagePageController = PageController(
    viewportFraction: 1.0,
  );
  final PageController _contentPageController = PageController(
    viewportFraction: 1.0,
  );

  //Function to handle the next button press
  void nextButtonPress() {
    if (currentPageIndex < pagesContent.length - 1) {
      _imagePageController.nextPage(
        duration: const Duration(milliseconds: 50),
        curve: Curves.decelerate,
      );
      _contentPageController.nextPage(
        duration: const Duration(milliseconds: 50),
        curve: Curves.decelerate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.backgroundColor,
        toolbarHeight: 50,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'Caros-Soft',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _imagePageController,
                onPageChanged: (int index) {
                  setState(() {
                    _contentPageController.jumpToPage(index);
                    currentPageIndex = index;
                  });
                },
                itemCount: pagesContent.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> item = pagesContent[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Image.asset(
                          item["image"],
                          height: 370,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            dottedIndicator(currentPageIndex),
            SizedBox(
              height: 185,
              child: PageView.builder(
                controller: _contentPageController,
                onPageChanged: (int index) {
                  setState(() {
                    _imagePageController.jumpToPage(index);
                    currentPageIndex = index;
                  });
                },
                itemCount: pagesContent.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> item = pagesContent[index];
                  final String firstLineText = item["firstLineText"];
                  final String secondLineRegularText =
                      item["secondLineText"]["regularText"];
                  final String secondLineBoldText =
                      item["secondLineText"]["boldText"];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                firstLineText,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 40,
                                  color: Colors.black,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: secondLineRegularText,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontFamily: 'Caros-Soft',
                                  ),
                                  children: [
                                    const WidgetSpan(
                                      child: SizedBox(width: 10),
                                    ),
                                    TextSpan(
                                      text: secondLineBoldText,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 40,
                                        color: Colors.black,
                                        fontFamily: 'Caros-Soft',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Center(
              child: IconButton(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0.0),
                onPressed: nextButtonPress,
                style: IconButton.styleFrom(
                  backgroundColor: Palette.primaryColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(25),
                ),
                icon: const Icon(
                  AppIcons.arrow_right,
                  weight: 20,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Dotted indicator
  Widget dottedIndicator(int currentPageIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pagesContent.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
          width: currentPageIndex == index ? 18.0 : 6.0,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: currentPageIndex == index
                ? Palette.primaryColor
                : Palette.grayColor,
          ),
        ),
      ),
    );
  }
}

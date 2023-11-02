//pub package imports
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Default package imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Local file imports
import '../../constants/palette.dart';
import '../../custom_icons.dart';
import 'package:ui_challenge/src/constants/assets_path.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // List of page's content
  final List<Map<String, dynamic>> pagesContent = [
    {
      "image": AssetsPath.kOnboardScreenImage1,
      "firstLineText": "Enjoy your",
      "secondLineText": {"regularText": "Life with", "boldText": "Plants"},
    },
    {
      "image": AssetsPath.kOnboardScreenImage2,
      "firstLineText": "Discover",
      "secondLineText": {"regularText": "New", "boldText": "Varieties"},
    },
    {
      "image": AssetsPath.kOnboardScreenImage3,
      "firstLineText": "Create a",
      "secondLineText": {"regularText": "Green", "boldText": "Oasis"},
    }
  ];

  int currentPageIndex = 0;
  //pageController for image
  final PageController _imagePageController = PageController(
    viewportFraction: 1.0,
  );

  //pageController for content
  final PageController _contentPageController = PageController(
    viewportFraction: 1.0,
  );

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

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
        primary: true,
        backgroundColor: Palette.kBackgroundPrimaryColor,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350.h,
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
                  return Image.asset(
                    item["image"],
                  );
                },
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            dottedIndicator(currentPageIndex),
            SizedBox(
              height: 45.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40.w),
              child: SizedBox(
                height: 130.h,
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          firstLineText,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 40.sp,
                            height: 1.3.h,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: secondLineRegularText,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 40.sp,
                              color: Palette.kFontPrimaryColor,
                              fontFamily: 'Caros-Soft',
                              height: 1.2.h,
                            ),
                            children: [
                              WidgetSpan(
                                child: SizedBox(width: 10.w),
                              ),
                              TextSpan(
                                text: secondLineBoldText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 40.sp,
                                  color: Palette.kFontPrimaryColor,
                                  fontFamily: 'Caros-Soft',
                                  height: 1.2.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: IconButton(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0.0),
                onPressed: nextButtonPress,
                style: IconButton.styleFrom(
                  backgroundColor: Palette.kButtonPrimaryColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(25),
                ),
                icon: Icon(
                  AppIcons.arrow_right,
                  size: 45.sp,
                  color: Palette.kIconColorWhite,
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
          margin: EdgeInsets.symmetric(horizontal: 3.0.w),
          width: currentPageIndex == index ? 18.0.w : 6.0.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0.r),
            color: currentPageIndex == index
                ? Palette.kPrimaryColor
                : Palette.kGrayColor,
          ),
        ),
      ),
    );
  }
}

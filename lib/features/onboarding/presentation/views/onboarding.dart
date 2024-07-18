import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:task1/features/welcome/presentation/views/welcome_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Color _getDotColor(int index) {
    if (_currentPage == index) {
      switch (index) {
        case 0:
          return const Color(0xffB91B2E);
        case 1:
          return const Color(0xff16B625);
        case 2:
          return const Color(0xff8A08DE);
        default:
          return Colors.red;
      }
    }
    return Colors.grey;
  }

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  Widget _buildImage(String assetName, Color color1, Color color2, Color color3,
          [int width = 80]) =>
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: color3,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Image.asset(assetName, cacheWidth: width)
        ],
      );

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 3000,
          infiniteAutoScroll: true,
          globalHeader: const Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16, right: 16),
              ),
            ),
          ),
          pages: [
            PageViewModel(
              titleWidget: Container(
                padding: const EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: const Text(
                  "البحث بالقرب منك",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              bodyWidget: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "ابخث عن المتاجر المفضلة التى تريده بموقعك او حيك",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              image: _buildImage(
                'assets/images/shop.png',
                const Color(0xffB91B2E),
                const Color(0xffD8A8AE),
                const Color(0xffEADADC),
              ),
              decoration: pageDecoration.copyWith(
                  boxDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                ),
              )),
            ),
            PageViewModel(
              titleWidget: Container(
                padding: const EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: const Text(
                  "عروض طازجة وجودة",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              bodyWidget: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "جميع العناصر لها نضارة حقيقية وهى مخصص لاحتياجاتك",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              image: _buildImage(
                'assets/images/shop.png',
                const Color(0xff16B625),
                const Color(0xff75CF7D),
                const Color(0xffC5EEC9),
              ),
              decoration: pageDecoration.copyWith(
                  titleTextStyle: const TextStyle(
                    color: Colors.green,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  boxDecoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                    ),
                  )),
            ),
            PageViewModel(
              titleWidget: Container(
                padding: const EdgeInsets.only(right: 12),
                alignment: Alignment.centerRight,
                child: const Text(
                  "تسليم سريع للمنزل",
                  style: TextStyle(
                    color: Color(0xff8A08DE),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              bodyWidget: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "جميع العناصر لها نضارة حقيقية وهى مخصص لاحتياجاتك",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              image: _buildImage(
                'assets/images/delivery.png',
                const Color(0xff8A08DE),
                const Color(0xffC289E7),
                const Color(0xffDEC2F0),
              ),
              decoration: pageDecoration.copyWith(
                  titleTextStyle: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  boxDecoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                    ),
                  )),
            ),
          ],
          onDone: () => _onIntroEnd(context),
          // You can override onSkip callback
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          //rtl: true, // Display as right-to-left
          next: const Icon(Icons.arrow_forward),
          done: Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xff8A08DE),
              borderRadius: BorderRadius.circular(8)

            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                '>',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: DotsDecorator(
            size: const Size(10.0, 10.0),
            color: const Color(0xFFBDBDBD),
            activeColor: _getDotColor(_currentPage),
            // Active dot color
            activeSize: const Size(22.0, 10.0),
            activeShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),

          nextStyle: ButtonStyle(
            iconColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor:
                MaterialStateProperty.all<Color>(_getDotColor(_currentPage)),
          ),
          onChange: _onPageChanged,
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_mvvc_course/presentation/resources/assets_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/color_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/strings_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController(
    initialPage: 0,
  );
  List<SliderObject> _getSliderData() => [
        SliderObject(
          AppStrings.onBoardingTitle1,
          AppStrings.onBoardingSubTitle1,
          ImageAssets.onboardingLogo1,
        ),
        SliderObject(
          AppStrings.onBoardingTitle2,
          AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2,
        ),
        SliderObject(
          AppStrings.onBoardingTitle3,
          AppStrings.onBoardingSubTitle3,
          ImageAssets.onboardingLogo3,
        ),
        SliderObject(
          AppStrings.onBoardingTitle4,
          AppStrings.onBoardingSubTitle4,
          ImageAssets.onboardingLogo4,
        ),
      ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        itemBuilder: ((context, index) {
          return OnboardingPage(
            _list[index],
          );
        }),
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left Arrow
          _currentIndex == 0
              ? const Padding(
                  padding: EdgeInsets.all(AppPadding.p14),
                  child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: InkWell(
                    onTap: () {
                      //goto next slide
                      _pageController.animateToPage(
                        _getPreviousIndex(),
                        duration: const Duration(
                          milliseconds: DurationConstant.d300,
                        ),
                        curve: Curves.bounceInOut,
                      );
                    },
                    child: SizedBox(
                      height: AppSize.s20,
                      width: AppSize.s20,
                      child: SvgPicture.asset(ImageAssets.leftArrowIc),
                    ),
                  ),
                ),
          //circles in between
          Row(
            children: List.generate(
              _list.length,
              (i) => _getProperCircle(i),
            ),
          ),
          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                //goto next slide
                _pageController.animateToPage(
                  _getNextIndex(),
                  duration: const Duration(
                    milliseconds: DurationConstant.d300,
                  ),
                  curve: Curves.bounceInOut,
                );
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _getProperCircle(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Container(
        width: AppSize.s12,
        height: AppSize.s12,
        decoration: BoxDecoration(
          color: _currentIndex == index
              ? ColorManager.primary
              : ColorManager.lightGrey,
          shape: BoxShape.circle,
        ),
        child: _currentIndex == index
            ? SvgPicture.asset(ImageAssets.hollowCircleIc)
            : SvgPicture.asset(ImageAssets.solidCircleIc),
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--;
    previousIndex == -1 ? _currentIndex = _list.length - 1 : 0;
    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;
    nextIndex >= _list.length ? _currentIndex = 0 : 0;
    return _currentIndex;
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject? _sliderObject;
  const OnboardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(
            AppPadding.p8,
          ),
          child: Text(
            _sliderObject!.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
            AppPadding.p8,
          ),
          child: Text(
            _sliderObject!.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(
          _sliderObject!.image,
        )
      ],
    );
  }
}

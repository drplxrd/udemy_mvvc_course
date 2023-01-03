// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:udemy_mvvc_course/presentation/resources/assets_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/color_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/strings_manager.dart';
import 'package:udemy_mvvc_course/presentation/resources/values_manager.dart';

import '../../domain/model.dart';
import 'onboarding_viewmodel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  //!removed it above the OnBoarding class below
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject, //to receive stream objects
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    return sliderViewObject == null
        ? Container()
        : Scaffold(
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
              itemCount: sliderViewObject.noOfSlides,
              onPageChanged: (value) {
                _viewModel.onPageChanged(value);
              },
              itemBuilder: ((context, index) {
                return OnboardingPage(
                  sliderViewObject.sliderObject,
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
                  _getBottomSheetWidget(sliderViewObject),
                ],
              ),
            ),
          );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left Arrow
          sliderViewObject.currentIndex == 0
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
                      //goto previous slide
                      _pageController.animateToPage(
                        _viewModel.goPrevious(),
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
              sliderViewObject.noOfSlides,
              (i) => _getProperCircle(i, sliderViewObject.currentIndex),
            ),
          ),
          //right arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              onTap: () {
                //goto next slide
                _pageController.animateToPage(
                  _viewModel.goNext(),
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

  Padding _getProperCircle(int index, int _currentIndex) {
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

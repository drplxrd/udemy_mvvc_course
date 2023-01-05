// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:async';
import '../../domain/model.dart';
import '../../presentation/base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream Controllers for state management
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //send this sliderData to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++;
    nextIndex >= _list.length ? _currentIndex = 0 : 0;
    _postDataToView();
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--;
    previousIndex == -1 ? _currentIndex = _list.length - 1 : 0;
    _postDataToView();

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  //input section
  @override
  Sink get inputSliderViewObject => _streamController.sink;
  //Output section
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
  //private functions of viewmodels
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
  _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        _list[_currentIndex],
        _currentIndex,
        _list.length,
      ),
    );
  }
}

//Sink is an input and Stream is an output
//inputs mean that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //When a user clicks on right arrow or swipe
  void goPrevious(); //When user clicks left arrow or swipe
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
  //this is the way to add data to the stream... Stream input
}

//Outputs mean data or results from viewmodel to view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int noOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.currentIndex, this.noOfSlides);
}

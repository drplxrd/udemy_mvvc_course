import 'dart:async';

import 'package:udemy_mvvc_course/domain/model.dart';
import 'package:udemy_mvvc_course/presentation/base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream Controllers for state management
  final StreamController _streamController =
      StreamController<SlideViewObject>();

  //inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
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
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int noOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.currentIndex, this.noOfSlides);
}

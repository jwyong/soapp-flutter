import 'package:flutter/material.dart';
import 'package:soapp/screens/base_vm.dart';

class HomeVM extends BaseVM with ChangeNotifier {
  // btm tabs
  late TabController homeTabController;

  /// for btm tab scrolling (switch between 5 main tabs)

  bool _swipeIsInProgress = false;
  bool _tapIsBeingExecuted = false;
  int _selectedIndex = 1;
  int _prevIndex = 1;

  void init() {
    homeTabController.animation?.addListener(() {
      if (!_tapIsBeingExecuted &&
          !_swipeIsInProgress &&
          (homeTabController.offset >= 0.5 ||
              homeTabController.offset <= -0.5)) {
        // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered
        int newIndex = homeTabController.offset > 0
            ? homeTabController.index + 1
            : homeTabController.index - 1;
        _swipeIsInProgress = true;
        _prevIndex = _selectedIndex;
        _selectedIndex = newIndex;

        // update ui
        tapBarItemOnClick(null);

      } else {
        if (!_tapIsBeingExecuted &&
            _swipeIsInProgress &&
            ((homeTabController.offset < 0.5 && homeTabController.offset > 0) ||
                (homeTabController.offset > -0.5 &&
                    homeTabController.offset < 0))) {
          // detects if a swipe is being reversed
          _swipeIsInProgress = false;
          _selectedIndex = _prevIndex;

          // update ui
          tapBarItemOnClick(null);
        }
      }
    });

    homeTabController.addListener(() {
      _swipeIsInProgress = false;
      _selectedIndex = homeTabController.index;

      if (_tapIsBeingExecuted == true) {
        _tapIsBeingExecuted = false;
      } else {
        if (homeTabController.indexIsChanging) {
          // this is only true when the tab is changed via tap
          _tapIsBeingExecuted = true;
        }
      }
    });
  }

  void tapBarItemOnClick(int? index) {
    homeTabController.index = index?? _selectedIndex;
    notifyListeners();
  }
}

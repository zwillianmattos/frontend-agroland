import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bottom_navigator_store.g.dart';

class BottomNavigatorStore = _BottomNavigatorStoreBase
    with _$BottomNavigatorStore;

abstract class _BottomNavigatorStoreBase with Store {
  @observable
  int currentIndex = 0;

  _BottomNavigatorStoreBase() {
    changePage(0);
  }

  @action
  changePage(index) {
    // if (currentIndex == index) return;

    currentIndex = index;

    if (index == 0) {
      Modular.to.navigate('/home');
    } else if (index == 1) {
      Modular.to.navigate('/community');
    } else if (index == 2) {
      Modular.to.navigate('/education/ebook');
    } else if (index == 4) {
      Modular.to.navigate('/configurations');
    }
  }
}

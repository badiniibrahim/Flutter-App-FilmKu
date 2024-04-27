import 'package:get/get_rx/get_rx.dart';

class MainState {
  final RxInt _currentPageIndex = RxInt(0);
  set currentPageIndex(value) => _currentPageIndex.value = value;
  int get currentPageIndex => _currentPageIndex.value;
}

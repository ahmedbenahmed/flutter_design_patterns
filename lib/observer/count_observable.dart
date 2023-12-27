import 'package:flutter_design_patterns/observer/observable.dart';
import 'package:flutter_design_patterns/observer/observer.dart';

class CountObservable implements Observable {
  final List<Observer> _amountObserverList = [];
  int _count = 0;

  void increment(int newValue) {
    _count = newValue;
    notifyObservers(_count);
  }

  @override
  void addObserver(Observer observer) {
    _amountObserverList.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _amountObserverList.remove(observer);
  }

  @override
  void notifyObservers(int newValue) {
    for (var observer in _amountObserverList) {
      observer.notifyChange(newValue);
    }
  }
}

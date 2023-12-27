import 'package:flutter_design_patterns/observer/observer.dart';

abstract class Observable {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers(int newValue);
}

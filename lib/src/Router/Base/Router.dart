import 'package:bethlehem/src/Route/Route.dart';
import 'package:bethlehem/src/interface/Observer.dart';
import 'package:bethlehem/src/interface/Subject.dart';

abstract class Router implements Subject {
  Route route;
  Observer observer;
  Router(this.route);
  dynamic match();
  void detect();
}

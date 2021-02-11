import 'package:angular/angular.dart';
import 'package:bethlehem/src/interface/Observer.dart';
import 'package:bethlehem/src/interface/Subject.dart';

class AngularView implements Observer {
  dynamic viewObject;
  Subject subject;
  dynamic objectController;
  final ComponentLoader loader;
  AngularView(this.subject, this.viewObject, this.loader) {
    subject.register(this);
  }
  @override
  void update(msg) {
    objectController = loader.loadNextToLocation(msg, viewObject);
  }
}

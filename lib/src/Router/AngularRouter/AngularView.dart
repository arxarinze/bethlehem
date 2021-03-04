import 'package:angular/angular.dart';
import 'package:bethlehem/src/interface/Observer.dart';
import 'package:bethlehem/src/interface/Subject.dart';

class AngularView implements Observer {
  dynamic viewObject;
  Subject subject;
  dynamic objectController;
  static const ComponentLoader loader = ComponentLoader();
  AngularView(this.subject, this.viewObject) {
    subject.register(this);
  }
  @override
  void update(msg) {
    objectController = viewObject(msg);
  }
}

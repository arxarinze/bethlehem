import 'dart:html';
import 'package:angular/angular.dart';

class Road {
  List<HtmlElement> links = [];
  final String _tag;
  Road.web(this._tag);

  void web() {
    var all = document.getElementsByTagName(_tag);
    all.forEach((element) {
      links.add(element);
    });
  }

  @Directive(selector: '[road]')
  void angular(
    Element el,
    @Attribute('road') String prefix,
  ) {}
}

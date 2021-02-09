import 'dart:html';

import 'package:bethlehem/src/interface/Observer.dart';
import 'package:bethlehem/src/interface/Subject.dart';

class WebView implements Observer {
  Subject subject;
  var browser;
  WebView(this.subject) {
    browser = document.getElementsByTagName('browser')[0];
    subject.register(this);
  }
  @override
  void update(dynamic msg) {
    (msg as Future<String>).then((e) {
      (browser as HtmlElement).setInnerHtml(e);
    });
  }
}

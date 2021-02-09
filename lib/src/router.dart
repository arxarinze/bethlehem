// TODO: Put public facing types in this file.

import 'dart:html';

import 'package:bethlehem/src/road/road.dart';

/// Checks if you are awesome. Spoiler: you are.
class Router {
  var browser;
  var view;
  Router.web(this.view) {
    browser = document.getElementsByTagName('browser')[0];
  }
  void routeByUrl() {
    var rd = Road.web('road');
    rd.web();
    rd.links.forEach((link) {
      link.addEventListener('click', (event) async {
        window.alert(link.dataset['url']);
        var template = await HttpRequest.getString('create.html');
        print(template);
        (browser as HtmlElement)
            .setInnerHtml(template, treeSanitizer: NodeTreeSanitizer.trusted);
      });
    });
  }
}

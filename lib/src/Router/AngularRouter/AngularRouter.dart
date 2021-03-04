import 'dart:html';

import 'package:bethlehem/src/Route/Route.dart';
import 'package:bethlehem/src/Router/AngularRouter/AngularView.dart';
import 'package:bethlehem/src/Router/Base/Router.dart';
import 'package:bethlehem/src/interface/Observer.dart';
import 'package:angular/angular.dart';
import 'package:collection/collection.dart';

class AngularRouter extends Router {
  var links = <dynamic>[];
  var currentUrl = '', previousUrl = '';
  AngularRouter(Route route) : super(route) {
    detect();
  }

  void makeUpdate() {
    currentUrl = window.location.hash.replaceAll('#', '');
    observer.update(match());
  }

  @override
  void detect() {
    window.addEventListener('popstate', (event) {
      (observer as AngularView).objectController.destroy();
      if ((event as PopStateEvent).state != null) {
        currentUrl = (event as PopStateEvent).state['url'].replaceAll('#', '');
        observer.update(match());
      }
    });
    document.addEventListener('road', (e) {
      previousUrl = window.location.toString();
      currentUrl = (e as CustomEvent).detail['url'];
      observer.update(match());
    });
  }

  @override
  dynamic match() {
    var urlSplit = currentUrl.split('/');
    urlSplit.remove('');
    var params = [];
    var type = [];
    var rules = [];
    var detectedRule = [];
    var i = 0;
    var found = 0;
    var check = [];
    if (urlSplit.isNotEmpty) {
      if (urlSplit.length == 1) {
        window.history.pushState({'url': '#' + urlSplit[0], 'params': []},
            urlSplit[0], '#' + urlSplit[0]);
        return route.routes[urlSplit[0]];
      } else if (urlSplit.length > 1) {
        for (var i = 1; i < urlSplit.length; i++) {
          params.add(urlSplit[i]);
        }
        route.getRules(urlSplit[0]).forEach((e) {
          if (e.length > 1) {
            rules.add(e);
          }
        });
        check = rules.map((e) => e).toList();
        for (var rule in rules) {
          if (params.length == rule.length - 1) {
            found = i;
            detectedRule.add(rule);
          }
          i = i + 1;
        }
        if (detectedRule.length == 1) {
          var temp = [];
          var tmpType = [];
          for (var rule in detectedRule) {
            rule.removeAt(0);
            temp.add(rule);
          }
          var r = [];
          temp.forEach((t) {
            t.forEach((e) {
              r.add(e.split(' ')[1]);
            });
          });
          tmpType.add(r);
          tmpType = tmpType[0].map((e) {
            e = e.replaceAll('<', '');
            e = e.replaceAll('>', '');
            return e;
          }).toList();
          var tmpt = [];
          tmpt.add(tmpType);
          for (var p in params) {
            if (int.parse(p, onError: (e) => null) != null) {
              type.add('int');
            } else {
              type.add('string');
            }
          }
          Function eq = const ListEquality().equals;
          if (eq(type, tmpt[0])) {
            window.history.pushState({'url': currentUrl, 'params': params},
                urlSplit[0], '#' + currentUrl);
            return route.routes[urlSplit[0] + '/' + check[found].join('/')];
          }
        } else {
          var temp = [];
          var tmpType = [];
          for (var rule in detectedRule) {
            rule.removeAt(0);
            temp.add(rule);
          }
          temp.forEach((t) {
            tmpType.add(t[0].split(' ')[1]);
          });

          tmpType = tmpType.map((e) {
            e = e.replaceAll('<', '');
            e = e.replaceAll('>', '');
            return e;
          }).toList();
          for (var p in params) {
            if (int.parse(p, onError: (e) => null) != null) {
              type.add('int');
            } else {
              type.add('string');
            }
          }
          var found;
          type.forEach((e) {
            found = tmpType.indexOf(e);
          });
          window.history.pushState({'url': currentUrl, 'params': params},
              urlSplit[0], '#' + currentUrl);
          return route.routes[urlSplit[0] + '/' + check[found].join('/')];
        }
      }
    }
  }

  @override
  void register(Observer observer) {
    this.observer = observer;
    if (window.location.hash.isNotEmpty) {
      makeUpdate();
    }
  }
}

@Directive(selector: '[road]')
void BethlehemDirective(
  Element el,
  @Attribute('road') String prefix,
) {
  var event = CustomEvent('road', detail: {'url': prefix});
  el.addEventListener('click', (e) {
    el.dispatchEvent(event);
  });
}

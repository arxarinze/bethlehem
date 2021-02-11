import 'dart:html';

import 'package:bethlehem/bethlehem.dart' as bethlehem;

void main() {
  var route = bethlehem.Route({
    'create': HttpRequest.getString('create.html'),
    'add': HttpRequest.getString('add.html'),
    'add/:id <int>': HttpRequest.getString('test1.html'),
    'add/:topic <string>': HttpRequest.getString('test2.html'),
    'add/:id <int>/:topic <string>/:id <int>':
        HttpRequest.getString('test3.html')
  });
  bethlehem.WebView(bethlehem.WebRouter(route));
}

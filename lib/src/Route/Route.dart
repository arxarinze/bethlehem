class Route {
  Map<String, dynamic> routes;

  Route({this.routes});

  List<dynamic> getRules(String first) {
    var result = [];
    routes.forEach((route, view) {
      if (route.split('/')[0].contains(first)) {
        result.add(route.split('/'));
      }
    });
    return result;
  }
}

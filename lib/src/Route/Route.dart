class Route {
  Map<String, dynamic> routeObject;

  Route(this.routeObject);

  List<dynamic> getRules(String first) {
    var result = [];
    routeObject.forEach((route, view) {
      if (route.split('/')[0].contains(first)) {
        result.add(route.split('/'));
      }
    });
    return result;
  }
}

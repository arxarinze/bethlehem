import 'dart:html';

class RouterState {
  dynamic _params;
  RouterState() {
    _params = window.history.state['params'];
  }

  dynamic get parameters => _params;
}

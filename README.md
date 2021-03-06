A library(router) for Dart developers when using RawDart or AngularDart.
## Usage

A simple usage example for Raw Dart:

```dart
import 'package:bethlehem/bethlehem.dart';

main() {
  var route = Route({
    'create': HttpRequest.getString('create.html'),
    'add': HttpRequest.getString('add.html'),
    'add/:id <int>': HttpRequest.getString('test1.html'),
    'add/:topic <string>': HttpRequest.getString('test2.html'),
    'add/:id <int>/:topic <string>/:id <int>':
        HttpRequest.getString('test3.html')
  });
  bethlehem.WebView(bethlehem.WebRouter(route));
}
```

```html
<body>
    <road data-url="/add">
        <button>Add</button>
    </road>
    <road data-url="/create">
        <button>Create</button>
    </road>
    <road data-url="/add/1">
        <button>Add Item 1</button>
    </road>
    <road data-url="/add/topic">
        <button>Add Item 2</button>
    </road>
    <road data-url="/add/1/love/1">
        <button>Add Item 3</button>
    </road>
    <browser></browser>
</body>
```
A simple usage example for AngularDart:


```dart
import 'package:angular/angular.dart';
import './bethlehem.dart' as beth;
import 'src/todo_list/todo_list_component.template.dart' as todo;

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components


@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [beth.BethlehemDirective],
)
class AppComponent implements OnInit {
  @ViewChild('placeholder', read: ViewContainerRef)
  ViewContainerRef placeholder;
  final ComponentLoader _loader;

  AppComponent(this._loader);

  @override
  void ngOnInit() {
    beth.AngularView(
        beth.AngularRouter(
            beth.Route({'todo':{
                'title':'Todo',
                'content': todo.TodoListComponentNgFactory
            }})),
        ConceptionObject);
  }

  dynamic ConceptionObject(msg){
      var inception = _loader.loadNextToLocation(
        app_drawer.AppDrawerComponentNgFactory, placeholder);
      return inception
  }
}
```

```html
<h1>My First AngularDart App</h1>
<span road="todo">test router</span>
<div>
    <div #placeholder>

    </div>
</div>
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/arxarinze/bethlehem/issues

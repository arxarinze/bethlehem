A library(router) for Dart developers.
## Usage

A simple usage example:

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

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/arxarinze/bethlehem.git

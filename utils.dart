import 'dart:convert';
import 'dart:collection';
import 'dart:io';

class Stack<T> {
  final _stack = DoubleLinkedQueue<T>();
  T pop() {
    return _stack.removeFirst();
  }

  T peek() {
    return _stack.first;
  }

  void push(T val) {
    _stack.addFirst(val);
  }
}

String combinePath(List<String> paths) {
  final separator = Platform.pathSeparator;
  return paths.reduce((x, y) => x + separator + y);
}

String addApiAttributes(String link, List<(String, String)> attributes) {
  return link +
      '?' +
      attributes.fold('', (x, y) => x + '&' + y.$1 + '=' + y.$2).substring(1);
}

Future<Map<String, dynamic>> HttpGetJson(HttpClient client, String link) async {
  final request = await client.getUrl(Uri.parse(link));
  final response = await request.close();
  final data = json.decode(await response.transform(utf8.decoder).join())
      as Map<String, dynamic>;
  return data;
}

extension JsonExtension on Map<String, dynamic> {
  T getProperty<T>(String property) {
    return this[property] as T;
  }

  Map<String, dynamic> getSubtree(String property) =>
      getProperty<Map<String, dynamic>>(property);

  Iterable<Map<String, dynamic>> getSubgarden(String property) =>
      getProperty<Iterable>(property).map((x) => x as Map<String, dynamic>);
}

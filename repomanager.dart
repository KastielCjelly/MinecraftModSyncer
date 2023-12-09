import 'dart:io';
import './common.dart';

class _RepoRecord {
  String link;
  String loader;

  _RepoRecord(this.link, this.loader);

  static (String, _RepoRecord) parse(String source) {
    final values = source.split(' ');
    return (values[0], _RepoRecord(values[1], values[2]));
  }
}

var _repos = <String, _RepoRecord>{};

void load() {
  final file = File(REPOS_PATH);
  for (var i in file.readAsLinesSync()) {
    var record = _RepoRecord.parse(i);
    _repos[record.$1] = record.$2;
  }
}

Iterable<(String, String, String)> getAllRepos() {
  return _repos.entries.map((x) => (x.key, x.value.link, x.value.loader));
}

(String, String) getRepoData(String name) {
  return (_repos[name]!.link, _repos[name]!.loader);
}

void addRepo(String name, String link, String loader) {
  _repos[name] = _RepoRecord(link, loader);
  final file = File(REPOS_PATH);
  file.writeAsStringSync('$name $link $loader' + '\n', mode: FileMode.append);
}

void changeRepo(String name,
    {String? newName, String? newLink, String? newLoader}) {
  if (newLoader != null) _repos[name]?.loader = newLoader;
  if (newLink != null) _repos[name]?.link = newLink;
  if (newName != null) {
    _repos[newName] = _repos[name]!;
    deleteRepo(name, shouldSave: false);
  }
  _save();
}

void deleteRepo(String name, {bool shouldSave = true}) {
  _repos.remove(name);
  if (shouldSave) _save();
}

void _save() {
  final file = File(REPOS_PATH);
  file.writeAsStringSync('');
  for (var i in _repos.entries) {
    file.writeAsStringSync(
        i.key + ' ' + i.value.link + ' ' + i.value.loader + '\n',
        mode: FileMode.append);
  }
}

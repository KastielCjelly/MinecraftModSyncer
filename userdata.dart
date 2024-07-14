import 'dart:io';
import './utils.dart' as utils;
import 'common.dart';

String get minecraftPath => _UserData.data!.minecraftPath;
void set minecraftPath(String value) => _UserData.data!.minecraftPath = value;

final CONFIG_PATH = utils.combinePath([DATA_PATH, 'config']);

class _UserData {
  static _UserData? data;
  String minecraftPath;
  //C-tor
  _UserData(this.minecraftPath);

  static void load() {
    final file = File(CONFIG_PATH);
    final contents = file.readAsLinesSync();
    if (contents.isEmpty) {
      data = _UserData(
          utils.combinePath([Platform.environment['APPDATA']!, '.minecraft']));
      return;
    }
    data = _UserData(contents[0]);
  }

  static void save() {
    final file = File(CONFIG_PATH);
    file.writeAsStringSync(data!.minecraftPath + '\n');
  }
}

void init() {
  final directory = Directory(DATA_PATH);
  directory.createSync(recursive: true);
  final configFile = File(CONFIG_PATH);
  configFile.createSync();
  final reposFile = File(REPOS_PATH);
  reposFile.createSync();
  _UserData.load();
  _UserData.save();
}

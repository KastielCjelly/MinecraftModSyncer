import 'dart:io';
import './utils.dart' as utils;

final DATA_PATH =
    utils.combinePath([Platform.environment['PROGRAMDATA']!, 'ModSyncer']);
final REPOS_PATH = utils.combinePath([DATA_PATH, 'repos']);

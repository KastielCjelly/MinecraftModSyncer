import 'dart:io';
import './utils.dart' as utils;

final DATA_PATH =
    //HOME for linux PROGRAMDATA for win
    utils.combinePath([Platform.environment['PROGRAMDATA']!, 'ModSyncer']);
final REPOS_PATH = utils.combinePath([DATA_PATH, 'repos']);

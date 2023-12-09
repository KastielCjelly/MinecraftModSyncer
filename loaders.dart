import 'dart:io';
import './utils.dart' as utils;
import 'userdata.dart' as userdata;
import 'utils.dart' show JsonExtension;

const _loaders = <String, void Function(String)>{'yandex': _loadWithYandex};
final _modsPath = utils.combinePath([userdata.minecraftPath, 'mods']);

void loadWith(String loader, String link) {
  final dir = Directory(_modsPath);
  dir.deleteSync(recursive: true);
  dir.create();
  _loaders[loader]?.call(link);
}

void _loadWithYandex(String link) async {
  const YANDEX_URL = 'https://cloud-api.yandex.net/v1/disk/public/resources';
  const CHUNK_SIZE = 4;

  final client = HttpClient();

  Future<Map<String, dynamic>> yandexJson(int limit, {int offset = 0}) async {
    return utils.HttpGetJson(
        client,
        utils.addApiAttributes(YANDEX_URL, [
          ('public_key', link),
          ('limit', limit.toString()),
          ('offset', offset.toString())
        ]));
  }

  var data = await yandexJson(0);
  var total = data.getSubtree('_embedded').getProperty<int>('total');
  var chunks = total / CHUNK_SIZE + 1;
  for (int _ = 0; _ < chunks; _++) {
    data = await yandexJson(CHUNK_SIZE, offset: _ * CHUNK_SIZE);
    final files = data.getSubtree('_embedded').getSubgarden('items');

    for (var file in files) {
      if (file.getProperty<String>('type') != 'file') continue;
      print(file.getProperty('name'));

      client
          .getUrl(Uri.parse(file.getProperty<String>('file')))
          .then((request) => request.close())
          .then((response) => response.pipe(File(utils
                  .combinePath([_modsPath, file.getProperty<String>('name')]))
              .openWrite()));
    }
  }
}

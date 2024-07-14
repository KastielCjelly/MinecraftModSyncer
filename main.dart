import './userdata.dart' as userdata;
import './repomanager.dart' as repomanager;
import './web.dart' as web;
import './commands.dart';

void main(List<String> args) {
  userdata.init();
  repomanager.load();
  try {
    if (args.length == 0) {
      guiStuff();
      return;
    }
    if (args[0] == 'no-gui') cliStuff(args.skip(1).toList());
    else guiStuff();
  } catch (error) {
    print('Oops, something went wrong :(');
  }
}

void guiStuff() {
  web.run();
}

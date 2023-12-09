import './userdata.dart' as userdata;
import './repomanager.dart' as repomanager;
import './loaders.dart' as loader;

void main(List<String> args) {
  userdata.init();
  repomanager.load();
  if (args[0] == 'no-gui') cliStuff(args.skip(1).toList());
}

void cliStuff(List<String> args) {
  const commands = {
    'help': help,
    'set-path': setPath,
    'view': view,
    'add': add,
    'rename': rename,
    'change-link': changeLink,
    'change-loader': changeLoader,
    'remove': remove,
    'load': load
  };

  if (commands.containsKey(args[0])) {
    commands[args[0]]!.call(args);
    return;
  }
  print('Command was not recognized: ' + args[0]);
}

void help(List<String> args) {
  print('''
set-path <path>
view
add <name> <link> <loader>
rename <oldName> <newName>
change-link <name> <newLink>
change-loader <name> <newLoader>
remove <name>
load <name>
''');
}

void remove(List<String> args) {
  repomanager.deleteRepo(args[1]);
  print('Repo was removed: ' + args[1]);
}

void changeLoader(List<String> args) {
  repomanager.changeRepo(args[1], newLoader: args[2]);
  print('Loader was set: ' + args[2]);
}

void changeLink(List<String> args) {
  repomanager.changeRepo(args[1], newLink: args[2]);
  print('Link was set: ' + args[2]);
}

void setPath(List<String> args) {
  userdata.minecraftPath = args[1];
  print('Minecraft directory path was set: ' + args[1]);
}

void view(List<String> args) {
  print('|' +
      'name'.padRight(32).padLeft(16) +
      '|' +
      'link'.padRight(64).padLeft(64) +
      '|' +
      'loader'.padRight(32).padLeft(16) +
      '|' +
      '\n');
  repomanager.getAllRepos().forEach((x) {
    print('|' +
        x.$1.padRight(32).padLeft(16) +
        '|' +
        x.$2.padRight(64).padLeft(64) +
        '|' +
        x.$3.padRight(32).padLeft(16) +
        '|' +
        '\n');
  });
}

void add(List<String> args) {
  repomanager.addRepo(args[1], args[2], args[3]);
  print('Repo was added: ' + args[1]);
}

void rename(List<String> args) {
  repomanager.changeRepo(args[1], newName: args[2]);
  print('Repo was renamed: ' + args[1] + '->' + args[2]);
}

void load(List<String> args) {
  final data = repomanager.getRepoData(args[1]);
  loader.loadWith(data.$2, data.$1);
}

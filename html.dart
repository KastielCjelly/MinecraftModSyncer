import './repomanager.dart' as repomanager;


const TITLE = 'Kastiel Cjelly\'s Mod Syncer';

String assemblePage() {
  var builder = StringBuffer();
  _html(builder);
  return builder.toString();
}

void _html(StringBuffer builder) {
  builder.write('<html>');
  _head(builder);
  _body(builder);
  builder.write('</html>');
}

void _head(StringBuffer builder) {
  builder.write('<head>');
  _title(builder);
  _script(builder);
  builder.write('</head>');
}

void _title(StringBuffer builder) {
  builder.write('<title>');
  builder.write(TITLE);
  builder.write('</title>');
}

void _script(StringBuffer builder) {
  builder.write('<script>');
  _loadFunc(builder);
  _addFunc(builder);
  builder.write('</script>');
}

void _loadFunc(StringBuffer builder) {
  builder.write('function loadMods(n) {window.location.href = "http://localhost:6969/load/"+n;} ');
}

void _addFunc(StringBuffer builder) {
  builder.write('function addMods() {var link = document.getElementById("linkInput").value;link = link.replace("https://disk.yandex.com/d/", "_YANDEXSHIT_");var name = document.getElementById("nameInput").value;window.location.href = "http://localhost:6969/add/" + name + "/" + link + "/yandex";}');
}

void _body(StringBuffer builder) {
  builder.write('<body>');
  _header(builder);
  _buttons(builder);
  _form(builder);
  builder.write('</body>');
}

void _header(StringBuffer builder) {
  builder.write('<h1>');
  builder.write(TITLE);
  builder.write('</h1>');
}

void _buttons(StringBuffer builder) {
  repomanager
    .getAllRepos()
    .forEach((x) => _button(builder, x));
}

void _button(StringBuffer builder, (String, String, String) button) {
  builder.write('<button onclick="loadMods(\'${button.$1}\')">');
  builder.write(button.$1);
  builder.write('</button>');
}

void _form(StringBuffer builder) {
  builder.write('<br/>');
  builder.write('<input type="text" id="nameInput">');
  builder.write('Name');
  builder.write('</input>');
  builder.write('<br/>');
  builder.write('<input type="text" id="linkInput">');
  builder.write('Link');
  builder.write('</input>');
  builder.write('<br/>');
  builder.write('<button onclick="addMods()">');
  builder.write('+');
  builder.write('</button>');
}
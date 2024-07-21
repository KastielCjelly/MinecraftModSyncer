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
  _style(builder);
  builder.write('</head>');
}

void _title(StringBuffer builder) {
  builder.write('<title>');
  builder.write(TITLE);
  builder.write('</title>');
}

void _script(StringBuffer builder) {
  builder.writeln('<script>');
  _sendCommandFunc(builder);
  _loadFunc(builder);
  _addFunc(builder);
  builder.write('</script>');
}

void _loadFunc(StringBuffer builder) {
  builder.writeln('function loadMods(n) {sendCommand("load", [n]);} ');
}

void _addFunc(StringBuffer builder) {
  builder.writeln('function addMods() {sendCommand("add", [document.getElementById("nameInput").value, document.getElementById("linkInput").value, "yandex"]);}');
}

void _sendCommandFunc(StringBuffer builder) {
  builder.writeln('function sendCommand(command, args) {');
  builder.writeln('var link = "http://localhost:6969?command=" + command;');
  builder.writeln('for (var i = 0; i < args.length; i++) {');
  builder.writeln('link += "&arg" + i + "=" + args[i];');
  builder.writeln('}');
  builder.writeln('window.location.href = link;');
  builder.writeln('}');
}

// css shit

void _style(StringBuffer builder) {
  builder.writeln('<style>');
  _bodyStyle(builder);
  _buttonStyle(builder);
  _formStyle(builder);
  builder.write('</style>');
}

void _bodyStyle(StringBuffer builder) {
  builder.writeln('body {');
  builder.writeln('background-color: #181818;');
  builder.writeln('font-family: "Montserrat", sans-serif;');
  builder.writeln('color: #f2f2f2;');
  builder.writeln('}');
}

void _buttonStyle(StringBuffer builder) {
  builder.writeln('button {');
  builder.writeln('color: #f2f2f2;');
  builder.writeln('background-color: #303030;');
  builder.writeln('border-radius: 20px;');
  builder.writeln('margin: 4 2;');
  builder.writeln('padding: 8;');
  builder.writeln('border-width: 0;');
  builder.writeln('font-size: 16pt;');
  builder.writeln('}');

  builder.writeln('button:hover {');
  builder.writeln('color: #f2f2f2;');
  builder.writeln('background-color: #505050;');
  builder.writeln('border-radius: 20px;');
  builder.writeln('margin: 4 2;');
  builder.writeln('padding: 8;');
  builder.writeln('border-width: 0;');
  builder.writeln('font-size: 18pt;');
  builder.writeln('}');

  builder.writeln('button:active {');
  builder.writeln('color: #f2f2f2;');
  builder.writeln('background-color: #505050;');
  builder.writeln('border-radius: 20px;');
  builder.writeln('margin: 4 2;');
  builder.writeln('padding: 8;');
  builder.writeln('border-width: 0;');
  builder.writeln('font-size: 14pt;');
  builder.writeln('}');
}

void _formStyle(StringBuffer builder) {
  builder.writeln('input {');
  builder.writeln('background-color: #303030;');
  builder.writeln('font-family: "Montserrat", sans-serif;');
  builder.writeln('color: #707070;');
  builder.writeln('border-radius: 20px;');
  builder.writeln('margin: 4 2;');
  builder.writeln('padding: 8;');
  builder.writeln('border-width: 0;');
  builder.writeln('font-size: 16pt;');
  builder.writeln('}');

  builder.writeln('input:focus {');
  builder.writeln('background-color: #707070;');
  builder.writeln('font-family: "Montserrat", sans-serif;');
  builder.writeln('color: #303030;');
  builder.writeln('border-radius: 10px;');
  builder.writeln('margin: 4 2;');
  builder.writeln('padding: 8;');
  builder.writeln('border: 0px 0 #000000;');
  builder.writeln('font-size: 16pt;');
  builder.writeln('}');
}

// css shit ends

void _body(StringBuffer builder) {
  builder.write('<body>');
  builder.write('<center>');
  _header(builder);
  _buttons(builder);
  _form(builder);
  builder.write('</center>');
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
  builder.write('<table>');
    builder.write('<tr>');

      builder.write('<td>');
        builder.write('<input type="text" id="nameInput" placeholder="name"/>');
      builder.write('</td>');

      builder.write('<td>');
        builder.write('<input type="text" id="linkInput" placeholder="link"/>');
      builder.write('</td>');

      builder.write('<td>');
        builder.write('<button onclick="addMods()">');
          builder.write('+');
        builder.write('</button>');
      builder.write('</td>');

    builder.write('</tr>');
  builder.write('</table>');
}
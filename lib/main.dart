import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';

import 'package:open_file/open_file.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future test() async {
    print('testing');
    // var res = await SimplePermissions.requestPermission(Permission. WriteExternalStorage);

    var htmlContent = """
    <!DOCTYPE html>
    <html>
      <head>
        <style>
          body {
            margin: 30px;
            text-align: center;
          }
          table,
          th,
          td {
            border: 1px solid black;
            border-collapse: collapse;
          }
          h2 {
            font-size: 20px;
            margin-bottom: 70px;
          }
        </style>
      </head>
      <body>
        <div style="margin-bottom: 40px">
          <img src="latus.png" width="250px" />
        </div>
        <h2>
          DECLARAÇÃO
        </h2>
        <div>
          <p style="text-align: justify">
            A Empresa Latus Sul de CGC 999.555.111/0001-47 sediada à rua Nome da
            Rua, 999 - NOME DO BAIRRO - CURITIBA - PR, representada por Nome do
            Representante na função de COORD. MANUFATURA , abaixo assinado, declara
            para fins de comprovação junto à a este orgão, que o empregado a seguir
            mencionado faz parte de seu quadro pessoal:
          </p>
        </div>
        <div style="text-align: left; margin-left: -40px; margin-top: 50px;">
          <ul style="list-style-type:none">
            <li>Nome: Nome do Funcionário</li>
            <li>CTPS: 99999999999 - série: 99999</li>
            <li>Data de Admissão: 11/09/2019</li>
            <li>Cargo atual: OPERADOR DE MANUFATURA A</li>
            <li>Departamento: C30404 - INJETORAS GRANDES</li>
            <li>Filial: 000001 - Fabrica Curitiba</li>
            <li>Cidade: Curitiba</li>
          </ul>
        </div>
        <div style="text-align: center; margin-top: 50px">
          <p style="text-align: justify">
            Declara ainda, que o referido empregado não se encontra, nesta data sob
            aviso prévio, prazo de experiência ou estágio probatório.
          </p>
        </div>
        <div style="text-align: center; margin-top: 50px">
          <p style="text-align: justify">
            Por ser expressão da verdade, firmamos a presente.
          </p>
        </div>
        <div style="margin-top: 60px; margin-bottom: 60px">
          <p style="text-align: center">
            curitiba, 20 de fevereiro de 2019.
          </p>
        </div>
        <div style="width: 280px; border-top: 1px solid black; margin: auto">
          <p style="text-align: center">
            Nome do Representante - RG nº: 99999999
          </p>
          <p style="text-align: center">
            LATUS SUL
          </p>
        </div>
      </body>
    </html>
    """;

    var targetFileName = "example_pdf_file";

    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        htmlContent, '${directory.path}', targetFileName);
    print(generatedPdfFile.path);
    await OpenFile.open(generatedPdfFile.path);
  }
}

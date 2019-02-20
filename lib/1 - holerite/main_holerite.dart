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
          th,
          td,
          p {
            padding: 5px;
            text-align: left;
          }
          caption {
            font-size: 20px;
            margin-bottom: 10px;
          }
          #logo {
            border: none;
          }
    
          #header {
            justify-content: center;
          }
          #endereco {
            font-size: 14px;
          }
    
          #tableVencimentos {
            width: 100%;
            margin-top: 40px;
          }
    
          #titleVencimentos {
            text-align: center;
            font-size: 20px;
            padding: 10px;
          }
    
          #titleDescontos {
            text-align: center;
            font-size: 20px;
            padding: 10px;
          }
        </style>
      </head>
      <body>
        <table style="width:100%;">
          <caption>
            DEMONSTRATIVO DE PAGAMENTO
          </caption>
    
          <!----------------------------Tabela Cabeçalho-------------------------------->
          <tr colspan="1" id="header">
            <th id="logo"><img src="latus.png" height="50"</th>
            <th
              colspan="2"
              style="text-align: center;"  
            >
              CÓDIGO FUNCIONAL <br />
              999999
            </th>
            <th
              colspan="7"
              style="text-align: left;"
            >
              NOME <br />
              RAFAEL FARIAS DE MELO
            </th>
          </tr>
    
          <tr>
            <td
              colspan="9"
              style="text-align: left;"
              >
              ENDEREÇO <br />
              RUA MESSIAS DE MORAES, 580 - GUABITUBA
            </td>
          </tr>
    
          <tr>
            <td
              colspan="4"
              style="text-align: center;"   
            >
              EMPRESA <br />
              LATUS SUL
            </td>
            <td
              colspan="5"
              style="text-align: left;"
              >
              CGC <br />
              76.487.041/0001-54
            </td>
          </tr>
    
          <tr>
            <td
              colspan="2"
              style="text-align: center;"
            >
              PERÍODO <br />
              05/2019
            </td>
            <td
              colspan="5"
              style="text-align: left;"  
            >
              CARGO <br />
              OPERADOR DE MÁQUINA II
            </td>
            <td 
              colspan="2"
              style="text-align: left;"
            >
              CTPS <br />
              9999999999999
            </td>
          </tr>
    
          <tr>
            <td colspan="1" style="text-align: center;">
              C.CUSTO <br />
              999999
            </td>
            <td colspan="1" style="text-align: center;">
              BANCO <br />
              237
            </td>
            <td colspan="1" style="text-align: center;">
              AG. <br />
              35415
            </td>
            <td colspan="1" style="text-align: center;">
              CC. <br />
              999999
            </td>
            <td colspan="3" style="text-align: center;">
              SALÁRIO NORMAL (HORISTA) <br />
              99999
            </td>
            <td colspan="1" style="text-align: center;">
              DSF <br />
              0
            </td>
            <td colspan="1" style="text-align: center;">
              DIR <br />
              0
            </td>
          </tr>
        </table>
    
        <!----------------------------Tabela Vencimentos-------------------------------->
        <table id="tableVencimentos">
          <tr>
            <th colspan="5" id="titleVencimentos">
              VENCIMENTOS
            </th>
          </tr>
    
          <tr>
            <td colspan="1" style="text-align: center; font-weight: bold">CONTA</td>
            <td colspan="2" style="text-align: center; font-weight: bold">
              DESCRIÇÃO
            </td>
            <td colspan="1" style="text-align: center; font-weight: bold">
              QUANTIDADE
            </td>
            <td colspan="1" style="text-align: center; font-weight: bold">
              VALOR TOTAL
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-bottom: none;
              border-right: 1px solid black;"
            >
              1002
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-bottom: none;
              border-bottom: none;
              border-right: 1px solid black"
            >
              DRS
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border: none;
              border-bottom: none;
              border-right: 1px solid black"
            >
              46,50
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-bottom: none;"
            >
              380,12
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-top: none;
              border-bottom: none;"
            >
              2045
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-top: none;
              border-bottom: none;"
            >
              SALÁRIO
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              120,50
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              650,12
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-top: none;
              border-bottom: none;"
            >
              1202
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-top: none;
              border-bottom: none;"
            >
              HORAS EXTRAS 100%
            </td>
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              85,50
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              520,12
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-top: none;
              border-bottom: none;"
            >
              4502
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-top: none;
              border-bottom: none;"
            >
              DRS S/ HORAS 100%
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              21,50
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              300,12
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-top: none;
              border-bottom: none;"
            >
              1005
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-top: none;
              border-bottom: none;"
            >
              HORAS IMPRODUTIVAS
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              96,50
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              630,12
            </td>
          </tr>
    
          <tr>
            <td colspan="4" style="padding: 30px"></td>
            <td colspan="1" style="text-align: center">
              TOTAL DE VENCIMENTOS <br />
              2.480.60
            </td>
          </tr>
        </table>
    
        <!----------------------------Tabela Descontos-------------------------------->
        <table
          style="width: 100%;
            margin-top: 40px;"
        >
          <tr>
            <th
              colspan="5"
              style="text-align: center;
            font-size: 20px;
            padding: 10px;"
            >
              DESCONTOS
            </th>
          </tr>
    
          <tr>
            <td colspan="1" style="text-align: center; font-weight: bold">CONTA</td>
            <td colspan="2" style="text-align: center; font-weight: bold">
              DESCRIÇÃO
            </td>
            <td colspan="1" style="text-align: center; font-weight: bold">
              QUANTIDADE
            </td>
            <td colspan="1" style="text-align: center; font-weight: bold">
              VALOR TOTAL
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                  border-bottom: none;
                  border-right: 1px solid black;"
            >
              1002
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                  border-bottom: none;
                  border-bottom: none;
                  border-right: 1px solid black"
            >
              ADTO SALARIAL DESCONTO
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border: none;
                  border-bottom: none;
                  border-right: 1px solid black"
            >
              -
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-bottom: none;"
            >
              690,00
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                  border-top: none;
                  border-bottom: none;"
            >
              2045
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                  border-top: none;
                  border-bottom: none;"
            >
              SEGURO DE VIDA
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              -
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              3,75
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                  border-top: none;
                  border-bottom: none;"
            >
              1202
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                  border-top: none;
                  border-bottom: none;"
            >
              REFEIÇÃO
            </td>
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              43,00
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              42,04
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                  border-top: none;
                  border-bottom: none;"
            >
              4502
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                  border-top: none;
                  border-bottom: none;"
            >
              REFEIÇÃO COMPLEMENTAR
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              -
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              57,42
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                  border-top: none;
                  border-bottom: none;"
            >
              1005
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                  border-top: none;
                  border-bottom: none;"
            >
              PARANÁ CLINICAS
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              1,00
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                  border-top: none;
                  border-bottom: none;"
            >
              18,96
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                        border-top: none;
                        border-bottom: none;"
            >
              1258
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                        border-top: none;
                        border-bottom: none;"
            >
              TICKET ALIMENTAÇÃO
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                        border-top: none;
                        border-bottom: none;"
            >
              20,00
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                        border-top: none;
                        border-bottom: none;"
            >
              80,00
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                        border-top: none;
                        border-bottom: none;"
            >
              4102
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                        border-top: none;
                        border-bottom: none;"
            >
              INSS FOLHA
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                        border-top: none;
                        border-bottom: none;"
            >
              9,00
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                        border-top: none;
                        border-bottom: none;"
            >
              185,63
            </td>
          </tr>
    
          <tr>
            <td
              colspan="4"
              style="padding: 30px;
              border-bottom: none;"
            ></td>
            <td colspan="1" style="text-align: center">
              TOTAL DE DESCONTOS <br />
              1.077.80
            </td>
          </tr>
          <tr>
            <td
              colspan="4"
              style="padding: 30px;
              border-top: none;"
            ></td>
            <td colspan="1" style="text-align: center">
              TOTAL LIQUIDO<br />
              984,76
            </td>
          </tr>
        </table>
    
        <!----------------------------Tabela Informações Adicionais-------------------------------->
        <table
          style="width: 100%;
                margin-top: 40px;"
        >
          <tr>
            <th
              colspan="4"
              style="text-align: center;
                font-size: 20px;
                padding: 10px;"
            >
              INFORMAÇÕES ADICIONAIS
            </th>
          </tr>
    
          <tr>
            <td colspan="1" style="text-align: center; font-weight: bold">CONTA</td>
            <td colspan="2" style="text-align: center; font-weight: bold">
              DESCRIÇÃO
            </td>
            <td colspan="1" style="text-align: center; font-weight: bold">
              VALOR TOTAL
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                      border-bottom: none;
                      border-right: 1px solid black;"
            >
              3001
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                      border-bottom: none;
                      border-bottom: none;
                      border-right: 1px solid black"
            >
              FGTS
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                      border-bottom: none;"
            >
              165,00
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                      border-top: none;
                      border-bottom: none;"
            >
              4004
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                      border-top: none;
                      border-bottom: none;"
            >
              BASE IRRF
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
                      border-top: none;
                      border-bottom: none;"
            >
              1.876,93
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
                      border-top: none;
                      border-bottom: none;"
            >
              4005
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
                      border-top: none;
                      border-bottom: none;"
            >
              BASE INSS EMPRESA
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;
              border-bottom: none;"
            >
              2.062,46
            </td>
          </tr>
    
          <tr>
            <td
              colspan="1"
              style="text-align: center;
              border-top: none;
              border-bottom: none;"
            >
              4006
            </td>
    
            <td
              colspan="2"
              style="text-align: left;
              border-bottom: none;
              border-top: none;"
            >
              BASE FGTS
            </td>
    
            <td
              colspan="1"
              style="text-align: right;
              border-top: none;"
            >
              2.062,46
            </td>
          </tr>
    
          </tr>
        </table>
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

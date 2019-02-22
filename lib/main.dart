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
  var nome = 'João de Mello';
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
            margin: 40px;
            text-align: center;
          }
          table,
          th,
          td {
            border: 1px solid black;
            border-collapse: collapse;
          }
        </style>
      </head>
      <body>
        <table style="width: 100%">
          <tr>
            <th style="text-align: center; border: none; padding: 10px">
              <img src="logo_brasao_mf.jpeg" width="90px" />
            </th>
    
            <th style="border: none; padding: 10px">
              <span style="font-size: 24px">Ministério da Fazenda </span> <br />
              <span style="font-size: 14px"
                >Secretária da Receita Federal do Brasil
              </span>
              <br />
              <span style="font-size: 14px"
                >Imposta sobre a Renda da Pessoa Física
              </span>
              <br />
              <span style="font-size: 18px">Exercício de 2019</span>
            </th>
    
            <th style="width: 40%; padding: 5px">
              Comprovante de Rendimentos Pagos e de Imposto sobre a Renda Retido na
              fonte
              <br />
              <br />
              Ano-calendário 2019
            </th>
          </tr>
        </table>
    
        <table style="width: 98%; margin: auto">
          <tr>
            <td style="font-size: 12px; text-align: center">
              Verifique as condições e o prazo para a apresentação da Declaração do
              Imposto sobre a Renda da Pessoa Fisíca para este ano-calendário no
              sitío da Secretária da Receita Federal do Brasil na Internet, no
              endereço: "www.receita.fazenda.gov.br".
            </td>
          </tr>
        </table>
    
        <!--Tabela 1. Fonte Pagadora Pessoa Jurídica-->
        <div style="margin-bottom: -13px">
          <p style="font-weight: bold; text-align: left; font-size: 14px">
            1. Fonte Pagadora Pessoa Jurídica
          </p>
        </div>
    
        <table style="width: 100%;">
          <tr>
            <td style="text-align: left; width: 30%">
              <span style="font-size: 14px; font-weight: bold; margin-left: 5px"
                >CNPJ</span
              >
              <br />
              <span style="font-size: 18px; margin-left: 5px"
                >45.785.025/0001-41</span
              >
            </td>
    
            <td style="text-align: left">
              <span style="font-size: 14px; font-weight: bold; margin-left: 5px"
                >Nome Empresarial</span
              >
              <br />
              <span style="font-size: 18px; margin-left: 5px">LATUS SUL</span>
            </td>
          </tr>
        </table>
    
        <!--Tabela 2. Pessoa Fisíca Beneficiária dos Rendimentos-->
        <div style="margin-bottom: -13px">
          <p style="font-weight: bold; text-align: left; font-size: 14px">
            2. Pessoa Fisíca Beneficiária dos Rendimentos
          </p>
        </div>
    
        <table style="width: 100%;">
          <tr>
            <td style="text-align: left; width: 30%">
              <span style="font-size: 14px; font-weight: bold; margin-left: 5px"
                >CPF</span
              >
              <br />
              <span style="font-size: 18px; margin-left: 5px">9999999999999</span>
            </td>
    
            <td style="text-align: left">
              <span style="font-size: 14px; font-weight: bold; margin-left: 5px"
                >Nome Completo</span
              >
              <br />
              <span style="font-size: 18px; margin-left: 5px"
                >'${nome.toString()}'</span
              >
            </td>
          </tr>
    
          <tr>
            <td style="text-align: left" colspan="2">
              <span style="font-size: 14px; font-weight: bold; margin-left: 5px"
                >Natureza do Rendimento</span
              >
              <br />
              <span style="font-size: 18px; margin-left: 5px"
                >Rendimentos do Trabalho Assalariado</span
              >
            </td>
          </tr>
        </table>
    
        <!--Tabela 3. Rendimentos Tributáveis, Deduções, e Imposto sobre a Renda Retido na fonte.-->
        <table style="width: 100%; margin-top: 15px; border: none">
          <tr>
            <th
              style="text-align: left; border: none; font-size: 14px; width: 80%;"
            >
              3. Rendimentos Tributáveis, Deduções, e Imposto sobre a Renda Retido
              na fonte.
            </th>
            <th style="text-align: right; border: none">Valores em reais</th>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              01. Total dos rendimentos (inclusive férias)
            </td>
            <td style="text-align: right">7.072,71</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              02. Contribuição previdenciária oficial
            </td>
            <td style="text-align: right">625,89</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              03. Contribuição a entidades de previdência complementar, pública ou
              privada e a fundos de aposentadoria prog. individual (Fapi)
              <b>(preencher também o quadro 7)</b>
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              04 Pensão alimenticia <b>(preencher também o quadro 7)</b>
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              05. Imposto sobre a renda na fonte
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
        </table>
    
        <!--Tabela 4. Rendimentos Isentos e Não Trubutáveis-->
        <table style="width: 100%; margin-top: 15px; border: none">
          <tr>
            <th
              style="text-align: left; border: none; font-size: 14px; width: 80%;"
            >
              4. Rendimentos Isentos e Não Trubutáveis
            </th>
            <th style="text-align: right; border: none">Valores em reais</th>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              01. Parcela isenta dos proventos de aposentadoria, reserva remunerada,
              reforma e pensão (65 anos ou mais)
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              02. Diárias e ajudas de custo
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              03. Pensão e proventos de aposentadoria ou reforma por moléstia grave;
              provento de aposentadoria ou reforma por acidente em serviço.
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              04 Lucros e dividendos, apurados a partir de 1996, pagos por pessoa
              jurídica (lucro real, presumido, ou arbitrado)
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              05. Valores pagos ao titular ou sócio de microempresa ou empresa de
              pequeno porte, exceto pro labore, alúgueis ou serviços prestados
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              06. Indenizações por recisão de contrato de trabalho, inclusive a
              titulo de PDV, e por acidente de trabalho
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              07. Outros (<b
                >Pis / Abono Férias / Abono CCT / Abono Res / Sal Família </b
              >)
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
        </table>
    
        <!--Tabela 5. Rendimentos sujeitos à Tributação Exclusiva (rendimento líquido)-->
        <table style="width: 100%; margin-top: 15px; border: none;">
          <tr>
            <th
              style="text-align: left; border: none; font-size: 14px; width: 80%;"
            >
              5. Rendimentos sujeitos à Tributação Exclusiva (rendimento líquido)
            </th>
            <th style="text-align: right; border: none">Valores em reais</th>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              01. Décimeo terceiro salário
            </td>
            <td style="text-align: right">573,43</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              02. Imposto sobre a renda retido na fonte sobre 13º salário
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px">
              03. Outros
            </td>
            <td style="text-align: right">0,00</td>
          </tr>
        </table>
    
        <!--Tabela 6. Rendimentos Recebidos Acumulados - Art. 12-A da Lei nº 7.713, de
              1988 (sujeito à tributação exclusiva)-->
        <table style="width: 100%; margin-top: 15px; border: none; margin-top:120px">
          <tr>
            <th style="text-align: left; border: none; font-size: 14px;">
              6. Rendimentos Recebidos Acumulados - Art. 12-A da Lei nº 7.713, de
              1988 (sujeito à tributação exclusiva)
            </th>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 16px; width: 55%">
              6.1 Número do processo:
            </td>
            <td style="text-align: left; font-size: 16px; width: 30%">
              Quantidade de meses: 0,00
            </td>
            <td style="width: 15%; border: none"></td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 16px;" colspan="1">
              Natureza do Rendimento:
            </td>
            <td style="text-align: right; font-size: 16px;" colspan="1">
              Valores em reais
            </td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              01. Total dos rendimentos tributáveis (inclusive férias e décimo
              terceiro salário)
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              02. Exclusão: Despesas com a ação judicial:
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              03. Dedução: Contribuição previdenciária oficial
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              04. Dedução: Pensão alimenticia <b>preencher também o quadro 7</b>
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              05. Imposto sobre a renda na fonte
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              06. Rendimentos isentos de pensão, proventos, de aposentadoria ou
              reforma por moléstia grave e ou aposentadoria ou reforma por acidente
              em serviço
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
        </table>
    
        <!--Tabela 6 continuação da tabela-->
        <!-- <table style="width: 100%;">
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              01. Total dos rendimentos tributáveis (inclusive férias e décimo
              terceiro salário)
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              02. Exclusão: Despesas com a ação judicial:
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              03. Dedução: Contribuição previdenciária oficial
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              04. Dedução: Pensão alimenticia <b>preencher também o quadro 7</b>
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              05. Imposto sobre a renda na fonte
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
    
          <tr>
            <td style="text-align: left; font-size: 14px; width: 70%">
              06. Rendimentos isentos de pensão, proventos, de aposentadoria ou
              reforma por moléstia grave e ou aposentadoria ou reforma por acidente
              em serviço
            </td>
            <td style="text-align: right; width: 30%">0,00</td>
          </tr>
        </table> -->
    
        <!--Tabela 7. Informações Complementares-->
        <table style="width: 100%; margin-top: 50px; border: none">
          <tr>
            <th
              style="text-align: left; border: none; font-size: 14px; width: 80%;"
            >
              7. Informações Complementares
            </th>
          </tr>
    
          <tr>
            <td
              style="text-align: left; font-size: 14px; border-bottom: none"
              colspan="4"
            >
              Pagamentos à Planos de Saúde, Contribuições Previdência Complementar e
              Pensão Alimentícia:
            </td>
          </tr>
    
          <tr>
            <td
              style="text-align: left; font-size: 14px; border-top: none; border-bottom: none"
              colspan="4"
            >
              Operadora - Plano Sáude: 76.458.741/0001-10 - PARANÁ CLINICAS PLANOS
              DE SAUDES S A
            </td>
          </tr>
        </table>
    
        <table style="width: 100%; border: none">
          <tr>
            <td
              style="text-align: left; width: 20%; border-right: none; border-top: none; border-bottom: none"
            >
              CPF
            </td>
            <td style="text-align: left;border: none">
              Nome
            </td>
            <td style="text-align: left; border: none">
              Dt Nasc
            </td>
            <td
              style="text-align: left; border-left: none; border-top: none; border-bottom: none"
            >
              Valor
            </td>
          </tr>
    
          <tr>
            <td
              style="text-align: left; width: 20%; border-right: none; border-bottom: none; border-top: none"
            >
              999999999999
            </td>
            <td style="text-align: left; border: none">Nome do Funcionário</td>
            <td style="text-align: left; border: none">20/10/1985</td>
            <td
              style="text-align: left; border-left: none; border-bottom: none; border-top: none "
            >
              70,85
            </td>
          </tr>
    
          <tr>
            <td style="text-align: left; border-top: none;" colspan="4">
              O total informado na linha 03 do Quadro 5 já inclui o valor total pago
              ao título de PLR correspondente a R\$ 0,00.
            </td>
          </tr>
        </table>
    
        <!--Tabela 8. Responsável Pelas Informações-->
        <table style="width: 100%; margin-top: 20px; border: none">
          <tr>
            <p
              style="text-align: left; font-weight: bold; font-size: 14px; margin-bottom: -20px"
            >
              8. Responsável Pelas Informações
            </p>
          </tr>
    
          <tr>
            <td
              style="text-align: left; border-bottom: none; font-size: 17px; padding-left: 7px;"
            >
              Nome:
            </td>
            <td
              style="text-align: left; border-bottom: none; font-size: 17px; padding-left: 7px;"
            >
              Data:
            </td>
            <td
              style="text-align: left; border-bottom: none; font-size: 17px; padding-left: 7px"
              7px;
            >
              Assinatura:
            </td>
          </tr>
    
          <tr>
            <td
              style="text-align: left; padding-bottom: 30px; font-size: 18px; border-top: none; padding-left: 5px"
            >
              LATUS SUL
            </td>
            <td
              style="text-align: left; padding-bottom: 30px; font-size: 18px; border-top: none; padding-left: 5px"
            >
              21/11/2019
            </td>
            <td
              style="text-align: left; padding-bottom: 30px; font-size: 18px; border-top: none; padding-left: 5px"
            ></td>
          </tr>
    
          <tr>
            <td style="text-align: left; border: none" colspan="3">
              Aprovado pela IN RFB nr 1.682, de 28 de Dezembro de 2016
            </td>
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

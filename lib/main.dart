import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('BILL GENERATION')),
        body: Center(child: GenerateButton()),
      ),
    );
  }
}

class GenerateButton extends StatelessWidget {
  Future<void> generatePdfAndPrint() async {
    final pdf = pw.Document();

    final ByteData data1 = await rootBundle.load('assets/rt.png');
    final Uint8List image1Bytes = data1.buffer.asUint8List();

    final ByteData data2 = await rootBundle.load('assets/qr.jpeg');
    final Uint8List image2Bytes = data2.buffer.asUint8List();

    final SignImage = pw.MemoryImage(
      (await rootBundle.load('assets/sign.png')).buffer.asUint8List(),
    );

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Container(
          child: pw.Stack(
            children: [
              pw.Positioned(
                left: 0,
                top: 0,
                child: pw.Image(
                  pw.MemoryImage(image1Bytes),
                  width: 70,
                  height: 70,
                ),
              ),
              pw.Positioned(
                right: 0,
                top: 0,
                child: pw.Image(
                  pw.MemoryImage(image2Bytes),
                  width: 70,
                  height: 70,
                ),
              ),
              pw.Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: pw.Container(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Column(
                    children: [
                      pw.Text(
                        'CHELLARAM TRADERS',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        '53C-1, Sivakami Bhavan, Kamaraj Nagar, Kattayanvillai, \nVetturnimadam Post, Nagercoil - 629003 \nPhone: 9566469825,7010872712,04652 220155',
                        style: pw.TextStyle(
                          fontSize: 10,
                          lineSpacing: 5.0,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        "      GST: 33CBLPS8514H1ZC               FSSAI:12421009000386",
                        style: pw.TextStyle(fontSize: 10, lineSpacing: 5.0),
                      ),
                      pw.Divider(),
                      pw.SizedBox(height: 2),
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Bill to: Ganapathi Store',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.left,
                              ),
                              pw.SizedBox(height: 7),
                              pw.Text(
                                'Location: Naloor',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.left,
                              ),
                              pw.SizedBox(height: 6),
                              pw.Text(
                                'Client phone: 9489760191',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.left,
                              ),
                            ],
                          ),
                          pw.SizedBox(width: 190),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Invoice Number: # 14667',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 6),
                              pw.Text(
                                'Ordered By: Mr.Ram Vignesh',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 6),
                              pw.Text(
                                'Date: 09-10-2023',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 15),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Row(
                            mainAxisAlignment:
                                pw.MainAxisAlignment.spaceBetween,
                            children: [
                              pw.Text(
                                'TOTAL AMOUNT:1500\n\nORDER ITEM\n\n',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 2),
                          pw.Container(
                            child: pw.Table.fromTextArray(
                              data: <List<String>>[
                                <String>[
                                  'SI.no.',
                                  'Name',
                                  'HSN',
                                  'MRP',
                                  'Quantity',
                                  'Price/unit',
                                  'GST %',
                                  'Net Rate',
                                  'Total'
                                ],
                                // Add your actual table data here
                                <String>[
                                  '1',
                                  'Sweet Laddu 10kg',
                                  '9009',
                                  '500',
                                  '2',
                                  '427',
                                  '5',
                                  '450',
                                  '900'
                                ],
                                <String>[
                                  '2',
                                  'PCFA Atta 1Kg',
                                  '4900',
                                  '50',
                                  '4',
                                  '40',
                                  '5',
                                  '45',
                                  '180'
                                ],
                                <String>[
                                  '3',
                                  'Sweet Corn',
                                  '1009',
                                  '70',
                                  '4',
                                  '57',
                                  '5',
                                  '60',
                                  '240'
                                ],
                                <String>[
                                  '4',
                                  'PCFA Atta 500 gram',
                                  '4900',
                                  '25',
                                  '8',
                                  '20',
                                  '5',
                                  '22.5',
                                  '180'
                                ],
                              ],
                              cellStyle: pw.TextStyle(fontSize: 10),
                              headerStyle: pw.TextStyle(
                                  fontSize: 10, fontWeight: pw.FontWeight.bold),
                              cellAlignments: {
                                0: pw.Alignment.centerLeft,
                                1: pw.Alignment.center,
                                2: pw.Alignment.center,
                                3: pw.Alignment.center,
                                4: pw.Alignment.center,
                                5: pw.Alignment.center,
                                6: pw.Alignment.center,
                                7: pw.Alignment.center,
                                8: pw.Alignment.centerRight,
                              },
                              headerDecoration: pw.BoxDecoration(
                                color: PdfColors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 11),
                      pw.SizedBox(height: 20),
                      pw.Container(
                        child: pw.Table.fromTextArray(
                          data: <List<String>>[
                            <String>[
                              'Tax Rate',
                              'Taxable Amount',
                              'CGST',
                              'SGST',
                              'Total Tax'
                            ],
                            <String>['5%', '1425', '37.5', '37.5', '75'],
                            <String>['Total', '1425', '37.5', '37.5', '75'],
                          ],
                          cellStyle: pw.TextStyle(fontSize: 10),
                          headerStyle: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold),
                          cellAlignments: {
                            0: pw.Alignment.centerLeft,
                            1: pw.Alignment.center,
                            2: pw.Alignment.center,
                            3: pw.Alignment.center,
                            4: pw.Alignment.center,
                            5: pw.Alignment.centerRight,
                          },
                          headerDecoration: pw.BoxDecoration(
                            color: PdfColors.green,
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 70),
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'BANK DETAILS:  ',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 12),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 12),
                              pw.Text(
                                'Beneficiary Name: CHELLARAM TRADERS',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 7),
                              pw.Text(
                                'Ac/No: : 270539442641187',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 7),
                              pw.Text(
                                'IFSC: TMBL0000270',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 7),
                              pw.Text(
                                'Bank:  Tamilnad Mercantile Bank Ltd.',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 7),
                              pw.Text(
                                'Branch: KANYAKULAM',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.right,
                              ),
                            ],
                          ),
                          pw.SizedBox(width: 90),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Text(
                                'Taxable Net Amount :   728.57',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.left,
                              ),
                              pw.SizedBox(height: 10),
                              pw.Text(
                                'GST :   36.43',
                                style: pw.TextStyle(fontSize: 10),
                                textAlign: pw.TextAlign.left,
                              ),
                              pw.SizedBox(height: 12),
                              pw.Text(
                                'TOTAL: 765',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                                textAlign: pw.TextAlign.left,
                              ),
                              pw.SizedBox(height: 15),
                              pw.Text(
                                'Seven Hundred Sixty Five Rupees Only/',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                                textAlign: pw.TextAlign.left,
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 4),
                      pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 70),
                              pw.Text(
                                'This is computer generated bill, no signature is required  ',
                                style: pw.TextStyle(fontSize: 9),
                                textAlign: pw.TextAlign.right,
                              ),
                            ],
                          ),
                          pw.SizedBox(width: 140),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Image(
                                  alignment: pw.Alignment.center,
                                  SignImage,
                                  fit: pw.BoxFit.cover,
                                  height: 40,
                                  width: 85),
                              pw.SizedBox(height: 20),
                              pw.Text('Authorised Signature',
                                  style: pw.TextStyle(fontSize: 9),
                                  textAlign: pw.TextAlign.right),
                            ],
                          ),
                        ],
                      ),
                      pw.SizedBox(height: 20),
                      pw.Container(
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Container(
                              margin: pw.EdgeInsets.only(left: 10),
                              child: pw.Text(
                                'Powered by stockflow',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                            pw.Container(
                              margin: pw.EdgeInsets.only(right: 10),
                              child: pw.Text(
                                'WWW.STOCKFLOW.COM',
                                style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: pw.BoxDecoration(
                          color: PdfColors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    final pdfBytes = pdf.save();
    await Printing.layoutPdf(onLayout: (format) async => pdfBytes);
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Print'),
      onPressed: generatePdfAndPrint,
    );
  }
}

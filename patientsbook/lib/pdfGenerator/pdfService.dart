import 'package:intl/intl.dart';
import 'package:patientsbook/database/isar_database.dart.dart';
import 'package:patientsbook/pdfGenerator/windows.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';

Future<void> createPDF(PastientDatas? pastientDatas) async {
  DateFormat formatter = DateFormat('yyyy/MM/dd');

  PdfDocument document = PdfDocument();
  final page = document.pages.add();
  // page.getClientSize().width;

  page.graphics.drawImage(
      PdfBitmap(await _readImageData(
        'chu.png',
      )),
      Rect.fromLTWH(0, 0, page.getClientSize().width, 60));

  page.graphics.drawString(
      'Date d\'entrée:          ${formatter.format(pastientDatas!.dateEntre)}',
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      format: PdfStringFormat(alignment: PdfTextAlignment.right),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(0, 100, page.getClientSize().width, 150));

  page.graphics.drawString('identificateur:          ${pastientDatas.id}',
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      format: PdfStringFormat(alignment: PdfTextAlignment.left),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(0, 100, page.getClientSize().width, 150));

  //Tableau patient donnée

  PdfGrid grid = PdfGrid();
  grid.style = PdfGridStyle(
    font: PdfStandardFont(PdfFontFamily.helvetica, 11),
    cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 50),
  );

  final PdfPaddings padding = PdfPaddings(left: 2);
  final PdfPen linePen = PdfPen(PdfColor(255, 255, 255), width: 0);
  final PdfPen lastRowBorderPen = PdfPen(PdfColor(255, 255, 255), width: 0);
  final PdfBorders borders =
      PdfBorders(left: linePen, top: linePen, bottom: linePen, right: linePen);
  final PdfBorders lastRowBorder = PdfBorders(
      left: linePen, top: linePen, bottom: lastRowBorderPen, right: linePen);

  grid.columns.add(count: 2);
  // grid.headers.add(1);
  grid.columns[0].width = 150;
  // grid.columns[1].width = 250;

  // PdfGridRow header = grid.headers[0];
  // header.cells[0].value = 'Patient';
  // header.cells[1].value = 'Diagnostique';

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = 'Nom:';
  row.cells[1].value = pastientDatas.nom;

  // PdfGridCell gridCell = PdfGridCell(
  //     row: row,
  //     format: PdfStringFormat(
  //         alignment: PdfTextAlignment.right,
  //         lineAlignment: PdfVerticalAlignment.middle,
  //         wordSpacing: 10));
  // row.cells[1].stringFormat = gridCell.stringFormat;
  row = grid.rows.add();
  row.cells[0].value = 'Prénom:';
  row.cells[1].value = pastientDatas.prenom;

  row = grid.rows.add();
  row.cells[0].value = 'Âge:';
  row.cells[1].value =
      (DateTime.now().year - pastientDatas.dateNaissance.year).toString();
  // row.cells[0].style.borders = lastRowBorder;
  // row.cells[0].width = 15;

  row = grid.rows.add();
  row.cells[0].value = 'Diagnostique:';
  row.cells[1].value = getDataFromPatient(pastientDatas.diagnostic);
  // 'Adobe Systems Incorporated\'s Portable Document Format (PDF) is the de facto'
  //     'standard for the accurate, reliable, and platform-independent representation of a paged'
  //     'document. It\'s the only universally accepted file format that allows pixel-perfect layouts.'
  //     'In addition, PDF supports user interaction and collaborative workflows that are not'
  //     'possible with printed documents.';

  row = grid.rows.add();

  row.cells[0].value = 'Signe Clinique:';
  row.cells[1].value = getDataFromPatient(pastientDatas.signeCliniques);

  row = grid.rows.add();
  row.cells[0].value = 'Examen Para Clinique:';
  row.cells[1].value = getDataFromPatient(pastientDatas.examenParaclinique);

  row = grid.rows.add();
  row.cells[0].value = 'Traitement:';
  row.cells[1].value = getDataFromPatient(pastientDatas.traitement);

  row = grid.rows.add();
  row.cells[0].value = 'Protocole Operatoire:';
  row.cells[1].value = getDataFromPatient(pastientDatas.protocolParaclinique);

  row = grid.rows.add();
  row.cells[0].value = 'Suite Operatoire:';
  row.cells[1].value = getDataFromPatient(pastientDatas.suitePostOperatoire);

  row = grid.rows.add();
  row.cells[0].value = 'Score et Classification:';
  row.cells[1].value = getDataFromPatient(pastientDatas.scoreClassification);

  row = grid.rows.add();
  row.cells[0].value = 'Anticedents:';
  row.cells[1].value = getDataFromPatient(pastientDatas.anticedents);

  for (int i = 0; i < grid.rows.count; i++) {
    final PdfGridRow headerRow = grid.rows[i];
    if (i == grid.rows.count - 1) {
      for (int j = 0; j < headerRow.cells.count; j++) {
        headerRow.cells[j].style.borders = lastRowBorder;
        headerRow.cells[j].style.borders = lastRowBorder;
      }
    } else {
      for (int j = 0; j < headerRow.cells.count; j++) {
        headerRow.cells[j].style.borders = borders;
      }
    }
  }
  // for (int i = 0; i < grid.columns.count; i++) {
  //   grid.columns[i].width = 80;
  // }
  // for (int i = 0; i < grid.headers.count; i++) {
  //   final PdfGridRow headerRow = grid.headers[i];
  //   for (int j = 0; j < headerRow.cells.count; j++) {
  //     headerRow.cells[j].style.borders = lastRowBorder;
  //   }
  // }

  PdfLayoutResult? resultOfGrid = grid.draw(
    page: page,
    bounds: const Rect.fromLTWH(0, 160, 0, 0),
  );
  resultOfGrid?.page.defaultLayer.graphics.clientSize;

  resultOfGrid!.page.graphics.drawString(
      'Date de sortie:          ${pastientDatas.dateSortie == null || formatter.format(pastientDatas.dateSortie!).isEmpty ? '' : formatter.format(pastientDatas.dateSortie!)}',
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      format: PdfStringFormat(alignment: PdfTextAlignment.left),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(
          0,
          (resultOfGrid.page.defaultLayer.graphics.clientSize.height) - 50,
          page.getClientSize().width,
          150));

  resultOfGrid.page.graphics.drawString(
      'Date de consultation:          ${formatter.format(DateTime.now())}',
      PdfStandardFont(PdfFontFamily.timesRoman, 12),
      format: PdfStringFormat(alignment: PdfTextAlignment.right),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: Rect.fromLTWH(
          0,
          (resultOfGrid.page.defaultLayer.graphics.clientSize.height) - 50,
          page.getClientSize().width,
          150));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

String getDataFromPatient(String data) {
  return data.isNotEmpty ? data : 'Aucun';
}

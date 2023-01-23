import 'dart:io';
import 'package:flutter/material.dart';

class PdfViewer extends StatelessWidget {
  
  PdfViewer({this.file,this.invoiceNo});
  String invoiceNo;
  final File file;

  @override
  Widget build(BuildContext context) {
    // return PDFViewerScaffold(
    //     appBar: AppBar(
    //       title: const Text('Invoice'),
    //     ),
    //     path: file.path);
    return Container();
  }
}
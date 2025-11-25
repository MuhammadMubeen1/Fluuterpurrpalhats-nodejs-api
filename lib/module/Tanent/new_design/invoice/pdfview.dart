import "dart:io";
import 'package:path_provider/path_provider.dart';
import "package:flutter/material.dart";
import "package:flutter_pdfview/flutter_pdfview.dart";
import 'package:http/http.dart' as http;

class PdfView extends StatefulWidget {
  final String pdfUrl;
  const PdfView({required this.pdfUrl, });

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  late PDFViewController _pdfController;

  Future<String> _getPdfBytes() async {
    // Download PDF bytes from the URL
    final response = await http.get(Uri.parse(widget.pdfUrl));

    // Create a temporary file to store the PDF
    final file = File('${(await getTemporaryDirectory()).path}/temp.pdf');
    await file.writeAsBytes(response.bodyBytes);

    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _getPdfBytes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return PDFView(
              filePath: snapshot.data.toString(),
              onRender: (pages) {
                // Do something when the PDF is rendered
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading PDF: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

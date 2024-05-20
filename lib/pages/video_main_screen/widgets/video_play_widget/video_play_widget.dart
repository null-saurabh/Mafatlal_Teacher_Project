import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:teaching_app/app_theme.dart';
import '../../../../modals/tbl_institute_topic_data.dart';

class VideoPlayWidget extends StatefulWidget {
  final InstituteTopicData? topic;
  const VideoPlayWidget({super.key, required this.topic});

  @override
  State<VideoPlayWidget> createState() => _VideoPlayWidgetState();
}

class _VideoPlayWidgetState extends State<VideoPlayWidget> {
  // late VlcPlayerController videoPlayerController;
  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset(
  //       'assets/testflutter pub run pdfx:install_web.pdf'),
  // );

  // File? _pdfFile;
  // final String path = "C:\\Users\\Saurabh\\Documents\\11.pdf";

  // @override
  // void initState() {
  //   super.initState();
  //   _loadPdfFile();
  // }
  //
  // Future<void> _loadPdfFile() async {
  //   final filePath = 'D:\\11.pdf';
  //   _pdfFile = File(filePath);
  //   setState(() {});
  //   print("in hh ${filePath}");
  // }

  // Future<void> _loadPdfFile() async {
  //   final pdfBytes = await readPdfFile();
  //   setState(() {
  //     _pdfFile = pdfBytes;
  //   });
  // }

  // Future<List<int>> readPdfFile() async {
  //   final filePath = 'C:\\Users\\Saurabh\\Documents\\11.pdf';
  //   final file = File(filePath);
  //   return await file.readAsBytes();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: ThemeColor.greyLight,
            ),
            color: ThemeColor.white,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.72,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  // if (widget.topics.topicDataType != "e-material")
                  // if (_pdfFile != null)
                  //   Center(child: SfPdfViewer.file(_pdfFile!))
                  // else
                  //   Center(child: TextButton(
                  //     onPressed: (){
                  //     print(_pdfFile);
                  //
                  //   },
                  //       child: Text(
                  //           'No PDF selected')
                  //       )
                  //   ),

                  SfPdfViewer.network(
                      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
                ],
              ),
            ),
          ],
        ));
  }
}

// else
//   VlcPlayer(
//     controller: videoPlayerController,
//     aspectRatio: 16 / 9,
//     placeholder:
//         const Center(child: CircularProgressIndicator()),
//   ),

// Positioned.fill(
//   child: Signature(
//     color: Colors.black, // Color of the drawing
//     strokeWidth: 2.0, // Thickness of the drawing lines
//   ),
// ),

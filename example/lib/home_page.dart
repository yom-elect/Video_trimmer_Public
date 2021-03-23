import 'dart:io';

import 'package:example/trimmer_view.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:popsical_video_trimmer/video_trimmer.dart';

class HomePage extends StatelessWidget {
  final Trimmer _trimmer = Trimmer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Trimmer"),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("LOAD VIDEO"),
            onPressed: () async {
              FilePickerResult result = await FilePicker.platform.pickFiles(
                type: FileType.video,
                allowCompression: false,
              );
              if (result != null) {
                File file = File(result.files.single.path);
                await _trimmer.loadVideo(videoFile: file);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return TrimmerView(_trimmer);
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

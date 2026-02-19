import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size; // in MB

  Ressource({required this.name, required this.size});
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  ValueNotifier<double> _progress = ValueNotifier(0.0); // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  ValueNotifier<double> get progress => _progress;

  // ACTIONS
  void startDownload() async {
    if (_status == DownloadStatus.downloading ||
        _status == DownloadStatus.downloaded) return;
    _status = DownloadStatus.downloading;
    progress.value = 0.0;
    notifyListeners();
    for (var i = 0; i < 10; i++) {
      // _progress.value += 0.1;
        progress.value = i / 10;
      await Future.delayed(const Duration(milliseconds: 1000));
       notifyListeners();
    }
    _status= DownloadStatus.downloaded;
    progress.value = 1.0; 
     notifyListeners();
    // TODO
    // 1 – set status to downloading
    // 2 – Loop 10 times and increment the download progress (0 -> 0.1 -> 0.2 )
    //      - Wait 1 second :  await Future.delayed(const Duration(milliseconds: 1000));

    // 3 – set status to downloaded
  }
}

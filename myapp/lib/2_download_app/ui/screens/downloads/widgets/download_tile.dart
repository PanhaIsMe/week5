import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: controller.progress,
      builder: (context, value, child) {
        Icon trailingIcon;
        switch (controller.status) {
          case DownloadStatus.notDownloaded:
            trailingIcon = Icon(Icons.download);
            break;
          case DownloadStatus.downloaded:
            trailingIcon = Icon(Icons.download_done);
            break;
          case DownloadStatus.downloading:
            trailingIcon = Icon(Icons.downloading);
            break;
        }

        return ListTile(
          title: Text(controller.ressource.name),
          trailing: trailingIcon,
          subtitle: Text(
            "${controller.ressource.size} KB of complete ${controller.progress.value*100}%",
          ),
          onTap: () => controller.startDownload(),
        );
      },
    );

    // TODO
  }
}


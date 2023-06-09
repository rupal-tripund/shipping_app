import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

  Future<void> saveFile(List<int> bytes, String filename) async {
    final path = (await getExternalStorageDirectory())?.path;
    final file = File('$path/$filename');
    file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$filename');
  }
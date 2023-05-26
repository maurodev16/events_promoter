import 'dart:io';
import 'package:http/http.dart' as http;

import 'IRepositoryAvatar.dart';

class RepositoryAvatar extends IRepositoryAvatar {
  final String _baseUrl = 'http://192.168.178.24:5000/api/Avatar/1/avatar';

  @override
  Future<bool> uploadAvatarProfile(File file) async {
    final bytes = await file.readAsBytes();
    final url = Uri.parse(_baseUrl);

    final request = http.MultipartRequest('POST', url)
      ..files.add(http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: file.path.split('/').last,
      ));

    final response = await http.Response.fromStream(await request.send());
    print(response.body);
    return response.statusCode == HttpStatus.ok;
  }
}

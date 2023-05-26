import 'dart:io';

import 'package:events_app/Repositories/RepositoryAvatar.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

import '../Models/PromoterModel.dart';

class AvatarController extends GetxController {
  final RepositoryAvatar repositoryAvatar = RepositoryAvatar();
  final userModel = PromoterModel().obs;

  Future<void> uploadAvatar() async {
    final pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile != null) {
      final file = File(pickedFile.files.single.path!);
      final success = await repositoryAvatar.uploadAvatarProfile(file);

      if (success) {
        // O upload foi bem-sucedido
        print("$success");
        print("Caminho do arquivo********$file");
      } else {
        // O upload falhou
        print("O upload falhou");
        print("Caminho do arquivo********$file");
      }
    } else {
      // Nenhum arquivo foi selecionado
      print("Nenhum arquivo foi selecionado");
    }
  }
}

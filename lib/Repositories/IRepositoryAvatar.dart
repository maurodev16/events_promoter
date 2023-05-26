import 'dart:io';

abstract class IRepositoryAvatar {
  Future<bool> uploadAvatarProfile(File file);
}

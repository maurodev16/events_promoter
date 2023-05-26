import 'package:events_app/Repositories/IRepositoryLogin.dart';
import 'package:get/get.dart';

class RepositoryLogin implements IRepositoryLogin {
  final baseUrl = "https://velhodalancha.onrender.com";
  final GetConnect httpClient = GetConnect();

  @override
  Future<String?> ilogin(String email, String password) async {
    final response = await httpClient.post(
      "$baseUrl/api/v1/auth/loginPromoter",
      {'email': email, 'password': password},
    );
    if (response.isOk) {
      //  return response.body['token'];
      print('Enviando dados: ${response.body!}');

      return response.bodyString;
    } else {
      return null;
    }
  }
}
  // uploadProgress: (percent) {
  //       // final progress = percent;
  //       //  print('Enviando dados: ${progress.toStringAsFixed(2)}%');+
  //       print('URL LOGIN****: $baseUrl');
  //     },
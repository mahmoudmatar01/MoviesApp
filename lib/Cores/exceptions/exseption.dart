import 'package:moviesapp/Cores/network/erroe_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

// class LocalException implements Exception{
//
//   final String Message;
//   LocalException({required this.Message});
// }

import '../data/model/auth_model.dart';

abstract class AuthRepositoryBase {
  Future<void> getAuthOTP();
  Future<void> verifyAuthOTP();
}

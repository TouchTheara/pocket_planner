import '../../domain/auth_base_repository.dart';

import '../model/auth_model.dart';

class AuthReposity implements AuthRepositoryBase {
  @override
  Future<void> getAuthOTP() async {}

  @override
  Future<void> verifyAuthOTP() async {}
}

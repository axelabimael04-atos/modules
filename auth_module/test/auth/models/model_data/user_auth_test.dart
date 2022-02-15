import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final AuthenticatedUser authenticatedUser = AuthenticatedUser(
    uid: 'si', 
    token: 'si', 
  );

  test(
    'should be a subclass of AuthenticatedUser entity',
    () async {
      // assert
      expect(authenticatedUser, isA<AuthenticatedUser>());
    },
  );
}
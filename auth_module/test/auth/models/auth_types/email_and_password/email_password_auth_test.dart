
import 'package:auth_module/auth/models/auth_types/auth_creator/auth_types.dart';
import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEmailAndPasswordAuth extends Mock implements AuthTypeRegister {}

void main() {
  MockEmailAndPasswordAuth mockEmailAndPasswordAuth = MockEmailAndPasswordAuth();

  String email = 'axel_aam@hotmail.com';
  String password = '12345679';

  final authenticatedUser = AuthenticatedUser(
      uid: 'si', 
      token: 'si', 
    );
 
  test(
    'Veryfing login result is AuthenticatedUser object',
    () async {
      // arrange
      when(()=>mockEmailAndPasswordAuth.signIn(email: email, password: password))
          .thenAnswer((_) async => Right(authenticatedUser));
      // act
      final result = await mockEmailAndPasswordAuth.signIn(email: email, password: password);
      // assert
      expect(result, Right(authenticatedUser));
      verify(()=>mockEmailAndPasswordAuth.signIn(email: email, password: password));
      verifyNoMoreInteractions(mockEmailAndPasswordAuth);
    },
  );

  test(
    'Veryfing signup result is AuthenticatedUser object',
    () async {
      // arrange
      when(()=>mockEmailAndPasswordAuth.signUp(email: email, password: password))
          .thenAnswer((_) async => Right(authenticatedUser));
      // act
      final result = await mockEmailAndPasswordAuth.signUp(email: email, password: password);
      // assert
      expect(result, Right(authenticatedUser));
      verify(()=>mockEmailAndPasswordAuth.signUp(email: email, password: password));
      verifyNoMoreInteractions(mockEmailAndPasswordAuth);
    },
  );
}

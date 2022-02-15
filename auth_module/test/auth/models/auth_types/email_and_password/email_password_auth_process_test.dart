
import 'package:auth_module/auth/models/auth_types/email_and_password/email_password_auth_process.dart';
import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEmailAndPasswordAuthProcess extends Mock implements EmailAndPasswordAuthProcess{

}

void main() {

  final String email = 'axel_aam@hotmail.com';
  final String password = '12345678';

  final authenticatedUser = AuthenticatedUser(uid: '', token: '');

  MockEmailAndPasswordAuthProcess mockEmailAndPasswordAuthProcess = MockEmailAndPasswordAuthProcess();

  test('verify sign in on firebase, and AutenticatedUser Object reponse', () async {

    when(()=>mockEmailAndPasswordAuthProcess.signIn(email: email, password: password))
          .thenAnswer((_) async => authenticatedUser);

    final user = await mockEmailAndPasswordAuthProcess.signIn(email: email, password: password);

    expect(user, authenticatedUser);
    verify(()=>mockEmailAndPasswordAuthProcess.signIn(email: email, password: password));
    verifyNoMoreInteractions(mockEmailAndPasswordAuthProcess);
    
  });

  test('verify sign up on firebase, and AutenticatedUser Object reponse', () async {

    when(()=>mockEmailAndPasswordAuthProcess.signUp(email: email, password: password))
          .thenAnswer((_) async => authenticatedUser);

    final user = await mockEmailAndPasswordAuthProcess.signUp(email: email, password: password);

    expect(user, authenticatedUser);
    verify(()=>mockEmailAndPasswordAuthProcess.signUp(email: email, password: password));
    verifyNoMoreInteractions(mockEmailAndPasswordAuthProcess);
    
  });
}
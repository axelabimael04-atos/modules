

import 'package:auth_module/auth/data/auth_impl.dart';
import 'package:auth_module/auth/src/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



main() {

  AuthImplementation authImpl = AuthImplementation();

  String email = 'axel_aam@hotmail.com';
  String password = '12345678';

  test('should verify a valid email', () {

    FormValidationResponse verifiedEmail = authImpl.validateEmail(email);

    expect(verifiedEmail.verified, true);
    
  });

  test('should verify a valid password', () {

    FormValidationResponse verifiedPass = authImpl.validatePassword(password);

    expect(verifiedPass.verified, true);
    
  });

  testWidgets('should verify a valid login fields', (tester) async {
    // AuthImplementation authImpl = AuthImplementation();

    await tester.pumpWidget(MaterialApp(
      home: AuthPage()
    ));
    final emailFind = find.byKey(Key('email-field'));
    final passwordFind = find.byKey(Key('password-field'));

    expect(emailFind, findsOneWidget);
    await tester.enterText(emailFind, email);
    await tester.pump();

    expect(passwordFind, findsOneWidget);
    await tester.enterText(passwordFind, password);
    await tester.pump();

    // final globalKeyFind = find.byKey(GlobalKey<FormState>());

    // print(globalKeyFind);

     final submitFind = find.byKey(Key('submit'));

    expect(submitFind, findsOneWidget);
    await tester.tap(submitFind);



    
  });

  test('should verify login process', () {
    
  });
  
}
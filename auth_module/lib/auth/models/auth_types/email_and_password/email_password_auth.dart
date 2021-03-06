

import 'package:auth_module/auth/models/auth_types/auth_creator/auth_types.dart';
import 'package:auth_module/auth/models/auth_types/auth_exceptions/auth_exception.dart';
import 'package:auth_module/auth/models/auth_types/email_and_password/email_password_auth_process.dart';
import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' as dartz;


 class EmailAndPasswordAuth extends AuthTypeRegister{

   EmailAndPasswordAuthProcess _emailAndPasswordAuthProcess = EmailAndPasswordAuthProcess();

  @override
  Future<dartz.Either<AuthException, AuthenticatedUser>> signIn({required String email, required String password}) async {
    try {
      return dartz.Right(await _emailAndPasswordAuthProcess.signIn(email: email, password: password));
    } on FirebaseException catch (e) {
      return dartz.Left(AuthException(e));
    }
  }

  @override
  Future<dartz.Either<AuthException, AuthenticatedUser>> signUp({required String email, required String password}) async {
    try {
      return dartz.Right(await _emailAndPasswordAuthProcess.signUp(email: email, password: password));
    } on FirebaseException catch (e) {
      return dartz.Left(AuthException(e));
    }
  }

  @override
  Future<void> signOut() async {
    
  }

}


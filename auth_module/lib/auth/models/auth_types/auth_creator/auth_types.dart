
import 'package:auth_module/auth/models/auth_types/auth_exceptions/auth_exception.dart';
import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:dartz/dartz.dart';



abstract class AuthTypeRegister with _AuthBaseType, _AuthRegister{}

abstract class AuthTypeCredential  with _AuthBaseType, _AuthCredentials{}


abstract class _AuthBaseType {
  
  Future<void> signOut();
  
}

mixin _AuthRegister {
  Future<Either<AuthException, AuthenticatedUser>> signIn({required String email, required String password});
  Future<Either<AuthException, AuthenticatedUser>> signUp({required String email, required String password});
}

mixin _AuthCredentials {
  Future<void> signInWithCredentials();
}
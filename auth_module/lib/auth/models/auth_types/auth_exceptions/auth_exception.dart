
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthException {
  late AuthExceptionDetails authExceptionStatus;
  late FirebaseException error;

  AuthException(this.error){
    getDetails();
  }
  AuthExceptionDetails getDetails() {
    switch (error.code.toString()) {

      case 'account-exists-with-different-credential':
        authExceptionStatus = AuthExceptionDetails(
            'Cuenta registrada con otro proveedor',
            error.code,
            AuthExceptionStatus.ACCOUNT_EXISTS_WITH_DIFERENT_CREDENTIAL);
        return authExceptionStatus;

      case 'invalid-credential':
        authExceptionStatus = AuthExceptionDetails('Credenciales inválidas',
            error.code, AuthExceptionStatus.INVALID_CREDENTIAL);
        return authExceptionStatus;

      case 'operation-not-allowed':
        authExceptionStatus = AuthExceptionDetails('Operación no permitida',
            error.code, AuthExceptionStatus.OPERATION_NOT_ALLOWED);
        return authExceptionStatus;

      case 'user-disabled':
        authExceptionStatus = AuthExceptionDetails('Cuenta deshabilitada',
            error.code, AuthExceptionStatus.USER_DISABLED);
        return authExceptionStatus;

      case 'user-not-found':
        authExceptionStatus = AuthExceptionDetails('Cuenta no encontrada',
            error.code, AuthExceptionStatus.USER_NOT_FOUND);
        return authExceptionStatus;

      case 'wrong-password':
        authExceptionStatus = AuthExceptionDetails('Contraseña incorrecta',
            error.code, AuthExceptionStatus.WRONG_PASSWORD);
        return authExceptionStatus;

      case 'email-already-in-use':
        authExceptionStatus = AuthExceptionDetails('Correo en uso', error.code,
            AuthExceptionStatus.EMAIL_ALREADY_IN_USE);
        return authExceptionStatus;

      case 'invalid-verification-code':
        authExceptionStatus = AuthExceptionDetails(
            'Código de verificación inválido',
            error.code,
            AuthExceptionStatus.INVALID_VERIFICATION_CODE);
        return authExceptionStatus;

      case 'invalid-verification-id':
        authExceptionStatus = AuthExceptionDetails(
            'ID de verificación inválido',
            error.code,
            AuthExceptionStatus.INVALID_VERIFICATION_ID);
        return authExceptionStatus;

        case 'too-many-requests':
        authExceptionStatus = AuthExceptionDetails(
            'Acceso temporalmente deshabilitado',
            error.code,
            AuthExceptionStatus.TOO_MANY_REQUESTS);
        return authExceptionStatus;


      default:
        authExceptionStatus = AuthExceptionDetails(
            'Error desconocido', error.code, AuthExceptionStatus.UNKNOWN);
        return authExceptionStatus;
    }
  }
}

enum AuthExceptionStatus {
  ACCOUNT_EXISTS_WITH_DIFERENT_CREDENTIAL,
  INVALID_CREDENTIAL,
  OPERATION_NOT_ALLOWED,
  USER_DISABLED,
  USER_NOT_FOUND,
  WRONG_PASSWORD,
  EMAIL_ALREADY_IN_USE,
  INVALID_VERIFICATION_CODE,
  INVALID_VERIFICATION_ID,
  TOO_MANY_REQUESTS,
  UNKNOWN,
}

class AuthExceptionDetails {
  final String message;
  final String errorCode;
  final AuthExceptionStatus status;

  AuthExceptionDetails(this.message, this.errorCode, this.status);
}

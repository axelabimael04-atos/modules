import 'package:auth_module/auth/models/auth_types/auth_creator/auth_types.dart';
import 'package:auth_module/auth/models/auth_types/auth_exceptions/auth_exception.dart';
import 'package:auth_module/auth/models/auth_types/email_and_password/email_password_auth.dart';
import 'package:auth_module/auth/models/model_data/user_auth.dart';
import 'package:dartz/dartz.dart';

export 'package:auth_module/auth/models/auth_types/auth_exceptions/auth_exception.dart';
export 'package:auth_module/auth/models/model_data/user_auth.dart';

class AuthSelector {
  late final dynamic _provider;
  //late final dynamic _authType;

  AuthSelector(AvailableAuthProviders provider) {
    switch (provider) {
      case AvailableAuthProviders.EmailAndPassword:
     // _authType = AuthTypeRegister;
      _provider = EmailAndPasswordAuth();

      break;

    //    case AvailableAuthProviders.Google:
    //  // _authType = AuthTypeRegister;
    //   _provider = GoogleAuth();

      break;
      default:
     // _authType = AuthTypeRegister;
      _provider = EmailAndPasswordAuth();
    }
  }

  Future<Either<AuthException, AuthenticatedUser>> executeLogIn({required String email, required String password}) async  {

    Either<AuthException, AuthenticatedUser> user = await _provider.signIn(email: email, password: password);

    //TODO: implements when auth providers

    // if(authType is AuthTypeRegister){

    //   user = await _provider.signIn(email: email, password: password);

    // } else if (authType is AuthTypeCredential){

    //   print('Login no soportado aun');

    // }


    return user;


  }
}

enum AvailableAuthProviders { EmailAndPassword, Google}

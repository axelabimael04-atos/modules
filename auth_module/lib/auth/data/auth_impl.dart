import 'package:auth_module/auth/models/auth_types/auth_creator/auth_selector.dart';
import 'package:auth_module/auth/src/widgets/circular_progress_dialog.dart';
import 'package:auth_module/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AuthImplementation {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  FormValidationResponse validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(pattern);

    if (!(regExp.hasMatch(value!))) {
      return FormValidationResponse(true, "Invalid email");
    } else {
      return FormValidationResponse(true, null);
    }
  }

  FormValidationResponse validatePassword(String? value) {
    if (value!.length < 6) return FormValidationResponse(true, 'The password must be 6 characters');
    return FormValidationResponse(true, null);
  }

 Future<void> signIn(BuildContext context,
      {required String email,
      required String password,
      required AvailableAuthProviders authSelector}) async {
    if (formKey.currentState!.validate()) {

      print('si esta pasando');

      showCircularProgressDialog(context, title: 'Log in');

      AuthSelector selection = AuthSelector(authSelector);

      Either<AuthException, AuthenticatedUser> user =
          await selection.executeLogIn(email: email, password: password);

      Navigator.pop(context);

      user.fold(
        (authException) {
          print(authException.getDetails().status);
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Ocurrió un error'),
              content: Text(authException.getDetails().message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Aceptar"))
              ],
            ));
        }, 
        (authenticateduser) {
          print('si inicio sesion');
          Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      );
    }
  }
}

class FormValidationResponse {
  final bool verified;
  final String? messageError;

  FormValidationResponse(this.verified, this.messageError);
}

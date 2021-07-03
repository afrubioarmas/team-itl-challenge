import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_intl_challenge/view/components/buttons/primary_button_text.dart';
import 'package:team_intl_challenge/view/screens/authentication_screen/authentiaction_screen_presenter.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/components/form_text_field.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreenPresenter _createAuthenticationScreenPresenter() {
    return AuthenticationScreenPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationScreenPresenter>(
        create: (context) => _createAuthenticationScreenPresenter(),
        child: Consumer<AuthenticationScreenPresenter>(
            builder: (context, presenter, staticChild) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Authentication",
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    FormTextField(
                      label: "Email",
                      textEditingController: presenter.emailTc,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      label: "Password",
                      isPassword: true,
                      textEditingController: presenter.passwordTc,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    presenter.loading
                        ? CircularProgressIndicator()
                        : PrimaryButtonText(
                            text: "Login",
                            action: () {
                              presenter.onLoginPressed();
                            },
                          ),
                    presenter.error != null
                        ? Text(
                            presenter.error,
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.red),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        }));
  }
}

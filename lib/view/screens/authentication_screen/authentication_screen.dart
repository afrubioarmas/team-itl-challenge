import 'package:flutter/material.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';
import 'package:team_intl_challenge/view/components/buttons/primary_button_text.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/components/form_text_field.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              ),
              SizedBox(
                height: 20,
              ),
              FormTextField(
                label: "Password",
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryButtonText(text: "Login",action: ()
              {locator<AppNavigator>().toHome();},),
              /*InkWell(
                child: Container(
                  child: Text("Don't have an account?"),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

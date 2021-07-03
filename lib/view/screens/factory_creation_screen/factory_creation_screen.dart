import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_intl_challenge/view/components/buttons/primary_button_text.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/components/form_text_field.dart';

import 'factory_creation_screen_presenter.dart';

class FactoryCreationScreen extends StatelessWidget {
  FactoryCreationScreenPresenter _createFactoryCreationScreenPresenter() {
    return FactoryCreationScreenPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FactoryCreationScreenPresenter>(
        create: (context) => _createFactoryCreationScreenPresenter(),
        child: Consumer<FactoryCreationScreenPresenter>(
            builder: (context, presenter, staticChild) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Create a Factory",
                style: Theme.of(context).textTheme.display1,
              ),
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  FormTextField(
                    label: "Name",
                    textEditingController: presenter.nameTc,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FormTextField(
                    label: "Address",
                    textEditingController: presenter.addressTc,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormTextField(
                          label: "Capacity/Second",
                          isNumber: true,
                          textEditingController: presenter.capacityTc,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: FormTextField(
                          label: "Error %",
                          isNumber: true,
                          textEditingController: presenter.errorTc,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  presenter.loading
                      ? CircularProgressIndicator()
                      : PrimaryButtonText(
                          text: "Save",
                          action: presenter.onSavePressed,
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
          );
        }));
  }
}

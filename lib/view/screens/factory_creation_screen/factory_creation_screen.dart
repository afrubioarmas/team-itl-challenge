import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_intl_challenge/view/components/buttons/primary_button_text.dart';
import 'package:team_intl_challenge/view/screens/factory_creation_screen/components/form_text_field.dart';

class FactoryCreationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(
              height: 25,
            ),
            FormTextField(
              label: "Address",
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
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: FormTextField(
                    label: "Error %",
                    isNumber: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            PrimaryButtonText(
              text: "Save",
            )
          ],
        ),
      ),
    );
  }
}

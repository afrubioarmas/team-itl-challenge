import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/model/factory.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

import 'components/factories_table.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Top Factories",
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          FactoriesTable(factories: [
            Factory(
                name: "name",
                address: "address",
                active: true,
                capacityPerSecond: 10,
                errorPercentage: 0.1,
                amount: 0),
          ])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<AppNavigator>().toFactoryCreation();
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Center(
          child: Text(
        "Andresfra@gmail.com",
        style: Theme.of(context).textTheme.display1.copyWith(fontSize: 15),
      )),
      actions: [
        Row(
          children: [
            Center(
              child: InkWell(
                  onTap: () {
                    locator<AppNavigator>().toAuthentication();
                  },
                  child: Icon(
                    FontAwesomeIcons.doorOpen,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              width: 20,
            )
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:team_intl_challenge/misc/helpers/logged_user_helper.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/navigators/app_navigator/app_navigator.dart';

import 'components/factories_table.dart';
import 'homescreen_presenter.dart';

class Homescreen extends StatelessWidget {
  HomescreenPresenter _createHomescreenPresenter() {
    return HomescreenPresenter();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomescreenPresenter>(
        create: (context) => _createHomescreenPresenter()..onViewCreated(),
        child: Consumer<HomescreenPresenter>(
            builder: (context, presenter, staticChild) {
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
                presenter.factories.length > 0
                    ? FactoriesTable(
                        factories: presenter.factories,
                        toggleActive: presenter.toggleActive,
                        recordPressed: presenter.onRecordPressed,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Text("Please add some "
                              "factories!"),
                        ),
                      )
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
        }));
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Center(
          child: Text(
        LoggedUserHelper.getLoggedUser().name,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_intl_challenge/model/factory.dart';

class FactoryDetailScreen extends StatelessWidget {
  Factory factory;

  FactoryDetailScreen(this.factory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Factory Detail",
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
            _buildEntry("Name: ", factory.name),
            SizedBox(
              height: 25,
            ),
            _buildEntry("Address: ", factory.address),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildEntry(
                      "Capacity/Sec: ", factory.capacityPerSecond.toString()),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: _buildEntry(
                      "Error %", factory.errorPercentage.toString()),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            _buildEntry("Active : ", factory.active.toString()),
            SizedBox(
              height: 25,
            ),
            _buildEntry("Amount : ", factory.amount.toString()),
          ],
        ),
      ),
    );
  }

  Row _buildEntry(String label, String value) {
    return Row(
      children: [
        Text(label),
        Text(value),
      ],
    );
  }
}

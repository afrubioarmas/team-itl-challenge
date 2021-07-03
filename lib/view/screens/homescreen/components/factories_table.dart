import 'package:flutter/material.dart';
import 'package:team_intl_challenge/model/factory.dart';

class FactoriesTable extends StatelessWidget {
  List<Factory> factories;
  Function toggleActive;
  Function recordPressed;

  FactoriesTable({this.factories, this.toggleActive, this.recordPressed});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columns: _buildColumns(),
      rows: _buildRows(context),
      columnSpacing: 10,
      horizontalMargin: 20,
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Cap/S")),
      DataColumn(label: Text("Error%")),
      DataColumn(label: Text("Amount")),
      DataColumn(label: Text("Active")),
    ];
  }

  List<DataRow> _buildRows(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;

    List<DataRow> output = <DataRow>[];

    for (int i = 0; i < factories.length; i++) {
      Factory actual = factories[i];

      output.add(DataRow(
          onSelectChanged: (selected) {
            if (selected) {
              recordPressed(i);
            }
          },
          cells: [
            DataCell(Container(
                width: width * .35,
                child: Text(
                  actual.name,
                ))),
            DataCell(Container(
                width: width * .15,
                child: Text(
                  actual.capacityPerSecond.toString(),
                  textAlign: TextAlign.center,
                ))),
            DataCell(Container(
                width: width * .1,
                child: Text(
                  actual.errorPercentage.toString(),
                  textAlign: TextAlign.center,
                ))),
            DataCell(Container(
                width: width * .15,
                child: Text(
                  actual.amount.toString(),
                  textAlign: TextAlign.center,
                ))),
            DataCell(
              InkWell(
                  onTap: () {
                    toggleActive(i);
                  },
                  child: Container(
                      width: width * .1,
                      child: actual.active
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank))),
            )
          ]));
    }

    return output;
  }
}

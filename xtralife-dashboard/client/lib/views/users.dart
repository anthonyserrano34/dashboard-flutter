import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.manage_accounts_outlined, size: 35),
                SizedBox(width: 20),
                Text('Users', style: TextStyle(fontSize: 35))
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 1000,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DataTable2(
                    columnSpacing: defaultPadding,
                    minWidth: 600,
                    columns: [
                      DataColumn(
                        label: Text("UserID"),
                      ),
                      DataColumn(
                        label: Text("Name"),
                      ),
                      DataColumn(
                        label: Text("Email"),
                      ),
                    ],
                    rows: List.generate(
                      demoRecentFiles.length,
                      (index) => recentFileDataRow(demoRecentFiles[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class RecentFile {
  final String? title, date, size;

  RecentFile({this.title, this.date, this.size});
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Text(fileInfo.title!),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}

List demoRecentFiles = [
  RecentFile(
    title: "5face64678a066ea4d39339c",
    date: "10123",
    size: "",
  ),
  RecentFile(
    title: "5face64678a066ea4d39339c",
    date: "10214 (Solitarius)",
    size: "",
  ),
];

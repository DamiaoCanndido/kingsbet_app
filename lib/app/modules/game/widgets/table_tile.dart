import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/models/table_model.dart';

class TableTile extends StatelessWidget {
  final TableModel tableModel;
  final int rank;
  const TableTile({super.key, required this.tableModel, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      color: Colors.white70,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Center(child: Text(rank.toString())),
            ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Text(tableModel.player!),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Center(child: Text(tableModel.points.toString())),
            ),
          )
        ],
      ),
    );
  }
}

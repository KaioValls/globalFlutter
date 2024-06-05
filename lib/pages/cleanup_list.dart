// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gs_oceans/components/list_item.dart';
import 'package:gs_oceans/models/cleanup_solution_model.dart';

class CleanupList extends StatefulWidget {
  const CleanupList({super.key});

  @override
  State<CleanupList> createState() => _CleanupListState();
}

class _CleanupListState extends State<CleanupList> {
  // Listagem de soluções de limpeza
  final List<CleanupSolution> list = CleanupSolution.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                // remover filtros
              },
              icon: Icon(Icons.refresh)),
          PopupMenuButton<CleanupStatus?>(
            onSelected: (status) => {
              // Filtrar por status
            },
            itemBuilder: (context) => [
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.inMaintenance,
                child: Text('In Maintenance'),
              ),
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.inOperation,
                child: Text('In Operation'),
              ),
              PopupMenuItem<CleanupStatus?>(
                value: CleanupStatus.harvesting,
                child: Text('Harvesting'),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: CleanupSolution.getList().length

      , itemBuilder: (context,index){
        return ListItem(item: list[index]);
      })
      );
  }
}

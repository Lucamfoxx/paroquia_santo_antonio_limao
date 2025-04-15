import 'package:flutter/material.dart';

class PreparacaoPage extends StatefulWidget {
  @override
  _PreparacaoPageState createState() => _PreparacaoPageState();
}

class _PreparacaoPageState extends State<PreparacaoPage> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToLeft() {
    try {
      _scrollController.animateTo(
        _scrollController.offset - MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } catch (e) {
      print('Erro ao rolar para a esquerda: $e');
    }
  }

  void _scrollToRight() {
    try {
      _scrollController.animateTo(
        _scrollController.offset + MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } catch (e) {
      print('Erro ao rolar para a direita: $e');
    }
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: DataTable(
        columnSpacing: 10,
        headingRowHeight: 60,
        dataRowHeight: 60,
        columns: _buildColumns(),
        rows: _buildRows(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preparações e Batizados'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Calendário das Preparações e Batizados 2025',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: buildDataTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(
        label: Text(
          'Curso de Batismo (09h30)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      DataColumn(
        label: Text(
          'Batismo (10h)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ];
  }

  List<DataRow> _buildRows() {
    return [
      DataRow(cells: [
        DataCell(Text('08/02')),
        DataCell(Text('22/02')),
      ]),
      DataRow(cells: [
        DataCell(Text('15/03')),
        DataCell(Text('29/03')),
      ]),
      DataRow(cells: [
        DataCell(Text('05/04')),
        DataCell(Text('26/04')),
      ]),
      DataRow(cells: [
        DataCell(Text('17/05')),
        DataCell(Text('31/05')),
      ]),
      DataRow(cells: [
        DataCell(Text('14/06')),
        DataCell(Text('28/06')),
      ]),
      DataRow(cells: [
        DataCell(Text('12/07')),
        DataCell(Text('26/07')),
      ]),
      DataRow(cells: [
        DataCell(Text('16/08')),
        DataCell(Text('30/08')),
      ]),
      DataRow(cells: [
        DataCell(Text('13/09')),
        DataCell(Text('27/09')),
      ]),
      DataRow(cells: [
        DataCell(Text('11/10')),
        DataCell(Text('25/10')),
      ]),
      DataRow(cells: [
        DataCell(Text('08/11')),
        DataCell(Text('29/11')),
      ]),
      DataRow(cells: [
        DataCell(Text('06/12')),
        DataCell(Text('20/12')),
      ]),
    ];
  }
}

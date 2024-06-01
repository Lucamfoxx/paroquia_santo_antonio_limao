import 'package:flutter/material.dart';

class FestasPage extends StatefulWidget {
  @override
  _FestasPageState createState() => _FestasPageState();
}

class _FestasPageState extends State<FestasPage> {
  double _fontSize = 20.0;

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 2.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Festas'),
        actions: [
          IconButton(
            icon: Icon(Icons.zoom_in),
            onPressed: _increaseFontSize,
          ),
          IconButton(
            icon: Icon(Icons.zoom_out),
            onPressed: _decreaseFontSize,
          ),
          SizedBox(height: 10)
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\nProgramação Religiosa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              EventSchedule(
                  fontSize: _fontSize), // Pass font size to EventSchedule
            ],
          ),
        ),
      ),
    );
  }
}

class EventSchedule extends StatelessWidget {
  final double fontSize;

  const EventSchedule({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        EventItem(
          date: 'Dia de Santo Antônio',
          description:
              '13/06 - Missas: 7h, 9h, 12h, 15h e 20h \n\nEm todas as missas, benção dos pães, bolo de Santo Antônio e objetos de devoção.',
          fontSize: fontSize, // Pass font size to EventItem
        ),
        SizedBox(height: 10),
        EventItem(
          date: 'Trezena e carreata de Santo Antônio',
          description:
              '31/05 (sexta feira) às 20h - Dom Carlos Silva- Bispo auxiliar da Região Brasilândia\n\n01/06 (sábado) às 17h - Pe. Rafael Araujo\n\n02/06 (Domingo) após a missa das 8h, Carreata Solidária  pelas ruas do bairro com a imagem de Santo Antonio\n\n02/06 (domingo) às 19h Pe. Romulo Freire\n\n03/06 (segunda feira) às 20h - Pe. Dorival Ferreira\n\n04/06 (terça feira) às 20h - Pe. Edmilson Silva\n\n05/06 (quarta feira) às 20h - Frei Carlos Silva OFM\n\n06/06 (quinta feira) às 20h - Pe. João Henrique\n\n07/06 (sexta feira) às 20h - Pe. José Ferreira\n\n08/06 (sábado) às 17h - Pe. Aldo Lima\n\n09/06 (domingo) às 19h - Pe. Frei Alonso Pires- OFM \n\n10/06 (Segunda feira) 20h - Pe. Evander Camilo\n\n11/06 (Terça feira) 20h - Pe. Cleyton Pontes\n\n12/06 (Quarta feira) 20h - Pe. Michelino Roberto',
          fontSize: fontSize, // Pass font size to EventItem
        ),
      ],
    );
  }
}

class EventItem extends StatelessWidget {
  final String date;
  final String description;
  final double fontSize;

  const EventItem({
    Key? key,
    required this.date,
    required this.description,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}

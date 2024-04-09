import 'package:flutter/material.dart';

class HorariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horários'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHorario(
                titulo: 'Pároco',
                texto: '''
Pe. Aldenor Alves De Lima.
(Aldo)
''',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Padre Cooperador Pastoral',
                texto: 'Pe. Adriano Robson',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Horário de Missas',
                texto: '''Segundas-feiras : 19h30
Terças e Quartas : 12h
Sexta-feira : 15h
Sábado : 17h
Domingo : 08h - 11h e 19h''',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Horário de Atendimento',
                texto: '''
Terça-feira: 08h as 12h e 14h as 18h
Quarta-feira: 08h as 12h e 14h as 18h
Quinta-feira: 08h as 12h e 14h as 18h
Sexta-feira: 08h as 12h e 14h as 18h
Sábado: 08h as 12h e 14h as 18h
''',
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildHorario({required String titulo, required String texto}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: _richTextChildren(texto),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<TextSpan> _richTextChildren(String texto) {
    final List<TextSpan> children = [];
    final List<String> lines = texto.split('\n');
    
    for (String line in lines) {
      final List<String> splitLine = line.split(':');
      final String firstPart = splitLine[0];
      final String secondPart = splitLine.length > 1 ? splitLine.sublist(1).join(':') : '';

      // Adiciona as partes do texto
      children.add(TextSpan(text: firstPart, style: TextStyle(fontWeight: FontWeight.bold)));
      if (secondPart.isNotEmpty) {
        children.add(TextSpan(text: ':$secondPart'));
      }
      
      // Adiciona quebra de linha entre as linhas
      children.add(TextSpan(text: '\n'));
    }

    return children;
  }
}

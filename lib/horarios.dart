import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
                titulo: 'Horário de Missas',
                texto: '''Segundas-feiras : 19h30
Terças e Quartas : 12h
Sexta-feira : 15h
Sábado : 17h
Domingo : 08h - 11h e 19h''',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Confissões',
                texto: '''De Terça a Sábado

Confirmar horário com a Secretaria.''',
              ),
              SizedBox(height: 20),
              _buildHorario(
                titulo: 'Horário de Atendimento',
                texto: '''
Terça-Feira: 08h as 12h e 14h as 18h
Quarta-Feira: 08h as 12h e 14h as 18h
Quinta-Feira: 08h as 12h e 14h as 18h
Sexta-Feira: 08h as 12h e 14h as 18h
Sábado: 08h as 12h e 14h as 18h

Domingo: --NÃO HÁ ATENDIMENTO--
Segunda-Feira: --NÃO HÁ ATENDIMENTO--
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
      elevation: 6,
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
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.4,
                ),
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
      final String secondPart =
          splitLine.length > 1 ? splitLine.sublist(1).join(':') : '';

      // Adiciona as partes do texto
      children.add(TextSpan(
          text: firstPart, style: TextStyle(fontWeight: FontWeight.bold)));
      if (secondPart.isNotEmpty) {
        children.add(TextSpan(text: ':$secondPart'));
      }

      // Adiciona quebra de linha entre as linhas
      children.add(TextSpan(text: '\n'));
    }

    return children;
  }
}

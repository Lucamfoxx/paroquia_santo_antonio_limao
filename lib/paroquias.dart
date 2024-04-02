import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ParoquiasPage extends StatelessWidget {
  const ParoquiasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decanato'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ParoquiaSetorTile(
                setor: 'Decanato São Pedro',
                paroquias: {
                  
                  'Paróquia Santo Antônio': '''
Festa litúrgica: 13 de Junho

Endereço: Avenida Professor Celestino Bourroul - 715 
Limão - São Paulo - SP - 02710-001

Horário de Missas
Segundas-feiras : 19h30
Terças e Quartas - 12hs
Sexta-feira : 15hs
Sábado : 17hs
Domingo : 08hs - 11hs e 19hs
Todas as missas são presenciais

Horário de Atendimento
SECRETARIA
Terça a Sexta das 8hs ás 18hs
Sábado das 8hs ás 12hs e das 13hs às 17hs

Pároco: Pe. ALDO
''',



                  'Paróquia São Miguel Arcanjo': '''
Festa litúrgica: 29 de Setembro

Endereço: Rua Maria Elisa Siqueira - 219 - - Vila Prado - São Paulo - - SP - 02558-000

Telefone: (11) 3858-3044

Horário de Missas
Segundas e Terças - 19h30
Quartas e Quintas - 07h30
Sextas - 19h30
Sábados - 07h30
Domingos - 07h30 - 09h30 e 19 horas

nosso e-mail: saomiguelarcanjovilaprado@gmail.com
Facebook.com/comunidadesmiguelarcanjo
Instagram.com/paroquiasaomiguela

Horário de Atendimento
Segunda, Terça, Quinta e Sexta - das 09hs ás 12hs e das 13hs ás 18hs
Quarta - NÃO TEM EXPEDIENTE
Sábado - 09hs ás 12hs e das 13hs ás 17hs
Domingo - NÃO TEM EXPEDIENTE

Administrador: Pe. Edson Fernandes

 
''',



                  'Paróquia São Luiz Gonzaga': '''
Festa litúrgica: 21 de Junho

Endereço: Rua Michel Ouchana - 50 - - Jaçanã - São Paulo - - SP - 02276-140

Telefone: (11) 2241-8986

Site: http://saoluizgonzaga.iparoquia.com

Horário de Missas
Segunda-feira : 15h00
Terça-feira : 19h00
Domingo : 09h00, 19h00

Pároco: Pe. Benedito Hercules Daniel

Vigário: Pe. Marcos Alves de Oliveira, CAM
''',



                  'Paróquia Santa Luzia': '''
Festa litúrgica: 13 de Dezembro

Endereço: Rua Padre Agostinho Poncet - 134 - - Mandaqui - São Paulo - - SP - 02408-040

Telefone: (11) 2976-1267

Facebook: https://www.facebook.com/paroquiasantaluziasp

Horário de Missas
Acompanhe as celebrações pelo facebook da paróquia todos os domingos às 10h

Administrador: Pe. Osvaldo Bisewski
''',



                  'Paróquia São José': '''
Endereço: R. Ribeirão das Almas, 337 - Freguesia do Ó, São Paulo - SP, 02728-100

Telefone: (11) 3931-5056

SEGUNDA: 7h - 15h (Missa das Almas) 

TERÇA: 7h e 19h 

QUARTA: 7h - 19h  

QUINTA: 7h e 19h 18h 

SEXTA: 7h - 15h e 19h 

SÁBADO: 10h - 19h

DOMINGO: 9h - 11h -  19h

TODO DIA 19: 7h - 15h - 19h Missa Votiva à São José 

Pe. MARCIO Campos da Silva, CSCh
(2016-Atual)


''',



                  'Paróquia Nossa Senhora das Graças': '''
Endereço: (Clique no endereço para ver no Google Maps)
Rua Marcelino de Camargo, 152
Vila Carolina - São Paulo - SP
CEP: 02724-040

Pároco: Pe. Edemilson Gonzaga de Camargo

Telefone(s): (11) 3936-1287

Site:

Missas:
Domingo:	07:30, 11:00, 18:30
Terça-feira:	20:00
Quinta-feira:	15:00
Sexta-feira:	20:00
''',

                  'Paróquia Santa Cruz': '''
MISSAS
3ª a 6ª feira às 19:30


Sábado às 15:00 (Missa das Crianças) e às 19:30

Domingo às 08:00, às 10:00 (Missa dos Jovens) e às 18:00

E-mail
santacruzdeitaberaba@gmail.com

Av. Itaberaba 2093, São Paulo, SP, 02739-000

Telefone
+ 55 11 3924 0515

Pe. Beto - Pároco
rocmoura@terra.com.br
''',


                  'Paróquia Nossa Senhora da Expectação': '''

Segunda-feira
às 15h
Missa pelas Almas

Terça, quarta e sexta-feira
às 07h e 19h30

Quinta-feira
às 07h

Sábado
às 16h

Domingo
às 07h, 09h, 11h e 18h

Todo dia 18
às 07h, 15h e 19h30

Localização:
Largo da Matriz de Nossa Senhora do Ó , s/nº, Freguesia do Ó

Atendimento da Secretaria:

De segunda a sexta-feira - das 08:00 as 12:00
De segunda a sexta-feira - das 14:00 as 17:00
Marcação de Intenções de Missas:

De Segunda a Sábado:
Das 08h00 às 18h00
Domingo das 07h00 às 12h00

Contatos:

(11) 3932-1702
(11) 3931-1898

WhatsApp: 

(11) 93385-2734

par.n.sra.o@uol.com.br

''',
 'Paroquial Nossa Senhora Do Carmo': '''

Endereço
Avenida Elísio Teixeira Leite , 1317 , Vila Brasilândia
Contato
(11) 3975-2569


Atendimento da secretaria: 

Terça-feira - das 09:00 as 12:00
Terça-feira - das 13:00 as 18:00
Quarta-feira - das 09:00 as 12:00
Quarta-feira - das 13:00 as 18:00
Quinta-feira - das 09:00 as 12:00
Quinta-feira - das 13:00 as 18:00
Sexta-feira - das 09:00 as 12:00
Sexta-feira - das 13:00 as 18:00
Sábado - das 09:00 as 12:00
Sábado - das 13:00 as 18:00

''',

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class ParoquiaSetorTile extends StatefulWidget {
  final String setor;
  final Map<String, String> paroquias;

  const ParoquiaSetorTile({
    Key? key,
    required this.setor,
    required this.paroquias,
  }) : super(key: key);

  @override
  _ParoquiaSetorTileState createState() => _ParoquiaSetorTileState();
}

class _ParoquiaSetorTileState extends State<ParoquiaSetorTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 219, 214),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.setor,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (_expanded)
          Column(
            children: widget.paroquias.entries.map((entry) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(entry.key),
                  onTap: () {
                    _showParoquiaInfo(context, entry.key, entry.value);
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  void _showParoquiaInfo(BuildContext context, String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getEmailWidgets(text),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _getEmailWidgets(String text) {
    final List<Widget> widgets = [];
    final RegExp emailRegex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b');
    final List<RegExpMatch> matches = emailRegex.allMatches(text).toList();
    int prevIndex = 0;
    for (var match in matches) {
      final String email = match.group(0)!;
      final int startIndex = match.start;
      final int endIndex = match.end;
      final String prefix = text.substring(prevIndex, startIndex);
      final String suffix = text.substring(endIndex);
      widgets.add(Text(prefix));
      widgets.add(
        GestureDetector(
          child: Text(
            email,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () async {
            final Uri _emailLaunchUri = Uri(scheme: 'mailto', path: email);
            if (await canLaunch(_emailLaunchUri.toString())) {
              await launch(_emailLaunchUri.toString());
            } else {
              throw 'Não foi possível abrir o endereço de e-mail $email';
            }
          },
        ),
      );
      prevIndex = endIndex;
    }
    if (prevIndex < text.length) {
      widgets.add(Text(text.substring(prevIndex)));
    }
    return widgets;
  }
}

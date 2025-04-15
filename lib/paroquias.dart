import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ParoquiasPage extends StatelessWidget {
  const ParoquiasPage({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> loadParoquias() async {
    final String response =
        await rootBundle.loadString('assets/paroquias.json');
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decanato'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadParoquias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar paróquias'));
          } else {
            final data = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ParoquiaSetorTile(
                      setor: data['setor'],
                      paroquias: Map<String, dynamic>.from(data['paroquias'])
                          .map((key, value) {
                        return MapEntry(key, {
                          'festa_liturgica': value['festa_liturgica'] ?? null,
                          'endereco': value['endereco'] ?? null,
                          'telefone': value['telefone'] ?? null,
                          'horario_missas': value['horario_missas'] ?? null,
                          'horario_atendimento':
                              value['horario_atendimento'] ?? null,
                          'paroco': value['paroco'] ?? null,
                          'email': value['email'] ?? null,
                          'redes_sociais': value['redes_sociais'] ?? null,
                        });
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class ParoquiaSetorTile extends StatefulWidget {
  final String setor;
  final Map<String, dynamic> paroquias;

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
                    _showParoquiaInfo(context, entry.key,
                        Map<String, dynamic>.from(entry.value));
                  },
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  void _showParoquiaInfo(
      BuildContext context, String title, Map<String, dynamic> info) {
    final List<Widget> widgets = [];
    final TextStyle linkStyle =
        TextStyle(color: Colors.blue, decoration: TextDecoration.underline);

    void addTile({
      required IconData icon,
      required String label,
      String? value,
      VoidCallback? onTap,
      bool forceShow = false,
    }) {
      if (value == null && onTap == null && !forceShow) return;

      widgets.add(
        ListTile(
          leading: Icon(icon),
          title: Text(label),
          subtitle: value != null
              ? Text(
                  value,
                  style: onTap != null
                      ? TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        )
                      : null,
                )
              : null,
          onTap: onTap,
        ),
      );
      widgets.add(const Divider());
    }

    addTile(
      icon: Icons.event,
      label: 'Festa Litúrgica',
      value: info['festa_liturgica'],
    );

    if (info['endereco'] != null) {
      final String endereco = info['endereco'];
      addTile(
        icon: Icons.location_on,
        label: 'Endereço',
        value: endereco,
        onTap: () => launchUrl(Uri.parse(
            "https://www.google.com/search?q=${Uri.encodeComponent(endereco)}")),
      );
    }

    if (info['telefone'] != null) {
      final telefone = info['telefone'];
      addTile(
        icon: Icons.phone,
        label: 'Telefone',
        value: telefone,
        onTap: () => launchUrl(Uri.parse("tel:$telefone")),
      );
    }

    addTile(
      icon: Icons.schedule,
      label: 'Horário das Missas',
      value: info['horario_missas'],
    );

    addTile(
      icon: Icons.access_time,
      label: 'Horário de Atendimento',
      value: info['horario_atendimento'],
    );

    addTile(
      icon: Icons.person,
      label: 'Pároco',
      value: info['paroco'],
    );

    if (info['email'] != null) {
      final String email = info['email'];
      addTile(
        icon: Icons.email,
        label: 'Email',
        value: email,
        onTap: () async {
          final Uri _emailLaunchUri = Uri(scheme: 'mailto', path: email);
          if (await canLaunch(_emailLaunchUri.toString())) {
            await launch(_emailLaunchUri.toString());
          }
        },
      );
    }

    final redesInfo = info['redes_sociais'];
    if (redesInfo is List) {
      final List<String> redes = List<String>.from(redesInfo);
      for (var url in redes) {
        if (url.toLowerCase().contains('facebook')) {
          addTile(
            icon: Icons.language,
            label: 'Facebook',
            value: 'Facebook',
            onTap: () => launchUrl(Uri.parse(url)),
          );
        } else if (url.toLowerCase().contains('instagram')) {
          addTile(
            icon: Icons.language,
            label: 'Instagram',
            value: 'Instagram',
            onTap: () => launchUrl(Uri.parse(url)),
          );
        }
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              ),
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
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer'; // For logging

class RespostaCard extends StatelessWidget {
  final Resposta resposta;
  const RespostaCard({required this.resposta, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ExpansionTile(
        title: Text(
          resposta.pergunta,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          resposta.nome,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Resposta: ${resposta.resposta}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}

class RespostasService {
  static const String _txtUrl =
      'https://drive.google.com/uc?id=14VSgrjPjwCia4nEJ4pkz79pXjuZS0Mby&export=download';

  static Future<List<Resposta>> fetchRespostas() async {
    try {
      final txtResponse = await http.get(Uri.parse(_txtUrl));
      if (txtResponse.statusCode != 200) {
        throw Exception('Falha ao carregar URL do gist');
      }
      final gistUrl = txtResponse.body.trim();
      final response = await http.get(Uri.parse(gistUrl));
      if (response.statusCode != 200) {
        throw Exception('Falha ao carregar respostas');
      }
      final data = json.decode(response.body);
      if (data is! Map<String, dynamic> ||
          data['respostas'] is! Map<String, dynamic>) {
        throw Exception('Formato de dados inválido para respostas');
      }
      final respostasMap = data['respostas'] as Map<String, dynamic>;
      // TODO: Consider using a JSON list instead of a map to simplify sorting
      final sortedKeys = respostasMap.keys.toList()
        ..sort((a, b) {
          final numA = int.tryParse(a.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
          final numB = int.tryParse(b.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
          return numB.compareTo(numA);
        });
      return sortedKeys.map((key) {
        final item = respostasMap[key] as Map<String, dynamic>;
        return Resposta(
          nome: item['nome'] ?? '',
          pergunta: item['pergunta'] ?? '',
          resposta: item['resposta'] ?? '',
        );
      }).toList();
    } catch (e, stack) {
      log('Erro ao buscar respostas: $e', stackTrace: stack);
      rethrow;
    }
  }
}

class Resposta {
  final String nome;
  final String pergunta;
  final String resposta;

  Resposta({
    required this.nome,
    required this.pergunta,
    required this.resposta,
  });
}

class RespostasPadrePage extends StatefulWidget {
  const RespostasPadrePage({Key? key}) : super(key: key);

  @override
  _RespostasPadrePageState createState() => _RespostasPadrePageState();
}

class _RespostasPadrePageState extends State<RespostasPadrePage> {
  String _getQuestionTitle(String question) {
    return question;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respostas do padre'),
      ),
      body: FutureBuilder<List<Resposta>>(
        future: RespostasService.fetchRespostas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Carregando novas perguntas e respostas...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar perguntas e respostas.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma resposta disponível.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          final respostas = snapshot.data!;
          return SafeArea(
            child: ListView.separated(
              itemCount: respostas.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) =>
                  RespostaCard(resposta: respostas[index]),
            ),
          );
        },
      ),
    );
  }
}

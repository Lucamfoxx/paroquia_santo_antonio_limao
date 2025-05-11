// caixa_perguntas_padre.dart
import 'package:flutter/material.dart';
import 'perguntas_form.dart';
import 'package:intl/intl.dart'; // TODO: use Intl.message for localization

class CaixaPerguntasPadrePage extends StatelessWidget {
  const CaixaPerguntasPadrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas para o Padre'),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: const [
              Tab(text: 'Pública'),
              Tab(text: 'Confidencial'),
            ],
          ),
        ),
        // TODO: wrap texts in Intl.message for translation
        body: const TabBarView(
          children: [
            PublicPerguntaForm(),
            ConfidencialPerguntaForm(),
          ],
        ),
      ),
    );
  }
}

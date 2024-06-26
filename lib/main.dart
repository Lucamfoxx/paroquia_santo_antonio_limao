import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'missa_diaria.dart';
import 'biblia.dart';
import 'santo_do_dia.dart';
import 'oracoes.dart';
import 'paroquias.dart';
import 'noticias.dart';
import 'inscricoes.dart'; // Importe a página inscricoes.dart
import 'package:firebase_core/firebase_core.dart';
import 'horarios.dart';
import 'historiaparoquia.dart';
import 'package:url_launcher/url_launcher.dart';
import 'inscricoes_batismo.dart';
import 'inscricoes_catequese_adulto.dart';
import 'inscricoes_casamento.dart';
import 'missas_intencoes.dart';
import 'pedido_missas.dart';
import 'pedido_intencoes.dart';
import 'santo_padroeiro.dart';
import 'sacramentos.dart';
import 'inscricoes_catequese_jovem.dart';
import 'inscricoes_catequese_infantil.dart';
import 'dizimista.dart';
import 'dizimosdoacoes.dart';
import 'festas.dart';
import 'preparacao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paróquia Santo Antônio do Limão',
      theme: ThemeData(
        scaffoldBackgroundColor:Color.fromARGB(255, 212, 177, 116),
      
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
          future: precacheImage(AssetImage('assets/logo.png'), context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MissaDiariaApp();
            } else {
              return Container();
            }
          },
        ),
        '/missa_diaria': (context) => MissaDiariaPage(),
        '/biblia': (context) => BibliaPage(),
        '/santo_do_dia': (context) => SantoDoDiaPage(),
        '/oracoes': (context) => OracoesPage(),
        '/paroquias': (context) => ParoquiasPage(),
        '/noticias': (context) => NoticiasPage(),
        '/horarios': (context) => HorariosPage(), // Rota para a página horarios.dart
        '/historiaparoquia': (context) => HistoriaParoquiaPage(),
        '/inscricoes': (context) => InscricoesPage(), // Rota para a página inscricoes.dart
        '/inscricoes_catequese': (context) => InscricoesCatequeseAdultoPage(),
        '/inscricoes_catequese_infantil': (context) => CatequeseInfantilPage(),
        '/inscricoes_catequese_jovem': (context) => CatequeseJovemPage(),
        '/inscricoes_batismo': (context) => InscricoesBatismoPage(),
        '/inscricoes_casamento': (context) => InscricoesCasamentoPage(),
        '/missas_intencoes': (context) => MissasIntencoesPage(),
        '/pedido_missas': (context) => PedidoMissasPage(),
        '/pedido_intencoes': (context) => PedidoIntencoesPage(),
        '/santo_padroeiro': (context) => SantoPadroeiro(),
        '/sacramentos': (context) => SacramentosPage(),
        '/dizimista': (context) => DizimistaPage(),
        '/dizimosdoacoes': (context) => DoacoesPage(),
        '/festas': (context) => FestasPage(),        
        '/preparacaobatismo': (context) => PreparacaoPage(),


      },
    );
  }
}

class MissaDiariaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paróquia Santo Antônio'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(height: 20),
                MenuButton('Inscrições', '/inscricoes'),
                MenuButton('Missas e Intenções', '/missas_intencoes'),                
                MenuButton('Dízimo e Doações', '/dizimosdoacoes'),
                MenuButton('Festas', '/festas'),                
                MenuButton('Santo Padroeiro', '/santo_padroeiro'),
                MenuButton('Sacramentos', '/sacramentos'),
                MenuButton('Liturgia Diária', '/missa_diaria'),
                MenuButton('Bíblia', '/biblia'),
                MenuButton('Santo do Dia', '/santo_do_dia'),
                MenuButton('Orações', '/oracoes'),
                MenuButton('Decanato São Pedro', '/paroquias'),
                MenuButton('Avisos Paroquiais', '/noticias'),
                MenuButton('Horários', '/horarios'), // Botão para Horários
                MenuButton('História da Paróquia', '/historiaparoquia'), // Botão para História da Paróquia
                SizedBox(height: 20), // Adiciona um espaço entre o menu e o texto com o endereço e telefone
                ContactInfo(), // Adiciona o widget com as informações de contato
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final String route;

  MenuButton(this.text, this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220, 219, 214)

,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Define a largura total da página
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/logo2.png', // Caminho para a imagem logo2.png
            fit: BoxFit.fill, // Preenche toda a área disponível
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              launch("https://www.instagram.com/paroquiadolimao/");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/insta.png', // Caminho para o ícone do WhatsApp personalizado
                  width: 25, // Largura do ícone
                  height: 25, // Altura do ícone
                  color: const Color.fromARGB(255, 0, 0, 0), // Cor do ícone
                ),
                SizedBox(width: 5),
                Text(
                  "@paroquiadolimao",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              launch("tel://+551145635838");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone, // Ícone de telefone padrão do Flutter
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                Text(
                  "(11) 4563-5838",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              launch("https://wa.me/5511976992158");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/whatsapp1.png', // Caminho para o ícone do WhatsApp personalizado
                  width: 36, // Largura do ícone
                  height: 36, // Altura do ícone
                  color: Colors.green, // Cor do ícone
                ),
                SizedBox(width: 5),
                Text(
                  "(11) 97699-2158",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () {
              launch("https://maps.app.goo.gl/tC6Tme5cTsyy5mDe6");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on, // Ícone de localização padrão do Flutter
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                Text(
                  '''
Av. Prof. Celestino Bourroul, 715 
Limão, São Paulo - SP, 02710-001''',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'liturgia_diaria.dart';
import 'biblia.dart';
import 'santo_do_dia.dart';
import 'oracoes.dart';
import 'paroquias.dart';
import 'noticias.dart';
import 'inscricoes.dart';
import 'horarios.dart';
import 'historiaparoquia.dart';
import 'inscricoes/inscricoes_batismo.dart';
import 'inscricoes/inscricoes_batismo_adult.dart';
import 'inscricoes/inscricoes_catequese_adulto.dart';
import 'inscricoes/inscricoes_casamento.dart';
import 'missas_intencoes.dart';
import 'missas/pedido_missas.dart';
import 'missas/pedido_intencoes.dart';
import 'santo_padroeiro.dart';
import 'sacramentos.dart';
import 'inscricoes/inscricoes_catequese_jovem.dart';
import 'inscricoes/inscricoes_catequese_infantil.dart';
import 'inscricoes/dizimista.dart';
import 'dizimosdoacoes.dart';
import 'preparacao.dart';
import 'terco/terco_online.dart';
import 'festas.dart';

// Novos imports para as funcionalidades escolhidas
import 'mural_de_empregos/mural_empregos.dart';
import 'perguntas/caixa_perguntas_padre.dart';
import 'checkin_igreja.dart';
import 'joguinhos_quizzes.dart';
// Nova importação para a página de respostas do padre
import 'respostas_padre.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting('pt_BR', null); // Adiciona esta linha
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paróquia Santo Antônio do Limão',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 212, 177, 116),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/missa_diaria': (context) => MissaDiariaPage(),
        '/biblia': (context) => BibliaPage(),
        '/santo_do_dia': (context) => SantoDoDiaPage(),
        '/oracoes': (context) => OracoesPage(),
        '/paroquias': (context) => ParoquiasPage(),
        '/noticias': (context) => NoticiasPage(),
        '/horarios': (context) => HorariosPage(),
        '/historiaparoquia': (context) => HistoriaParoquiaPage(),
        '/inscricoes': (context) => InscricoesPage(),
        '/inscricoes_catequese': (context) => InscricoesCatequeseAdultoPage(),
        '/inscricoes_catequese_infantil': (context) => CatequeseInfantilPage(),
        '/inscricoes_catequese_jovem': (context) => CatequeseJovemPage(),
        '/inscricoes_batismo': (context) => InscricoesBatismoPage(),
        '/inscricoes_batismo_adult': (context) => InscricoesBatismoAdultPage(),
        '/inscricoes_casamento': (context) => InscricoesCasamentoPage(),
        '/missas_intencoes': (context) => MissasIntencoesPage(),
        '/pedido_missas': (context) => PedidoMissasPage(),
        '/pedido_intencoes': (context) => PedidoIntencoesPage(),
        '/terco_online': (context) => TercoOlinePage(),
        '/festas': (context) => FestasPage(),
        '/santo_padroeiro': (context) => SantoPadroeiro(),
        '/sacramentos': (context) => SacramentosPage(),
        '/dizimista': (context) => DizimistaPage(),
        '/dizimosdoacoes': (context) => DoacoesPage(),
        '/preparacaobatismo': (context) => PreparacaoPage(),
        // Funcionalidades interativas e extras:
        '/mural_empregos': (context) => MuralEmpregosPage(),
        '/caixa_perguntas_padre': (context) => CaixaPerguntasPadrePage(),
        '/checkin_igreja': (context) => CheckinIgrejaPage(),
        '/joguinhos_quizzes': (context) => JoguinhosQuizzesPage(),
        '/respostas_padre': (context) => RespostasPadrePage(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(AssetImage('assets/logo.png'), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MissaDiariaApp();
        } else {
          return Center(child: CircularProgressIndicator());
        }
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
                // Ordem dos itens de menu reorganizada:
                MenuButton('Inscrições', '/inscricoes'),
                MenuButton('Missas e Intenções', '/missas_intencoes'),
                MenuButton('Liturgia Diária', '/missa_diaria'),
                MenuButton('Terço', '/terco_online'),
                MenuButton('Eventos', '/festas'),
                MenuButton('Avisos Paroquiais', '/noticias'),
                MenuButton('Bíblia', '/biblia'),
                MenuButton('Mural de Empregos Católico', '/mural_empregos'),
                MenuButton('Caixa de Perguntas para o Padre',
                    '/caixa_perguntas_padre'),
                MenuButton('Mural de Respostas do padre', '/respostas_padre'),
                MenuButton('Check-in na Igreja', '/checkin_igreja'),
                MenuButton('Santo Padroeiro', '/santo_padroeiro'),
                MenuButton('Sacramentos', '/sacramentos'),
                //MenuButton('Joguinhos e Quizzes Bíblicos', '/joguinhos_quizzes'),
                MenuButton('Santo do Dia', '/santo_do_dia'),
                MenuButton('Orações', '/oracoes'),
                MenuButton('Decanato São Pedro', '/paroquias'),
                MenuButton('Horários', '/horarios'),
                MenuButton('História da Paróquia', '/historiaparoquia'),
                // Widget de Contato adicionado no final da página
                ContactInfo(),
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
        color: Color.fromARGB(255, 220, 219, 214),
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
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/logo2.png',
            fit: BoxFit.fill,
          ),
          SizedBox(height: 10),
          SocialLink(
            url: "https://www.instagram.com/paroquiadolimao/",
            iconPath: 'assets/insta.png',
            label: "@paroquiadolimao",
          ),
          SizedBox(height: 10),
          SocialLink(
            url: "tel://+551145635838",
            icon: Icon(Icons.phone, color: Colors.blue),
            label: "(11) 4563-5838",
          ),
          SizedBox(height: 10),
          SocialLink(
            url: "https://wa.me/5511976992158",
            iconPath: 'assets/whatsapp1.png',
            label: "(11) 97699-2158",
            iconColor: Colors.green,
          ),
          SizedBox(height: 10),
          SocialLink(
            url: "https://maps.app.goo.gl/tC6Tme5cTsyy5mDe6",
            icon: Icon(Icons.location_on, color: Colors.blue),
            label: '''
Av. Prof. Celestino Bourroul, 715 
Limão, São Paulo - SP, 02710-001''',
          ),
        ],
      ),
    );
  }
}

class SocialLink extends StatelessWidget {
  final String url;
  final String? iconPath;
  final Icon? icon;
  final String label;
  final Color? iconColor;

  SocialLink({
    required this.url,
    required this.label,
    this.iconPath,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launch(url),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPath != null)
            Image.asset(
              iconPath!,
              width: 25,
              height: 25,
              color: iconColor ?? Colors.black,
            )
          else if (icon != null)
            icon!,
          SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

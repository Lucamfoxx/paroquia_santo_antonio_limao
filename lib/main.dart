import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'package:url_launcher/url_launcher.dart';

import 'missa_diaria.dart';
import 'biblia.dart';
import 'santo_do_dia.dart';
import 'oracoes.dart';
import 'paroquias.dart';
import 'noticias.dart';
import 'inscricoes.dart';
import 'horarios.dart';
import 'historiaparoquia.dart';
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
import 'preparacao.dart';
import 'terco_online.dart';
import 'festas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
      fileName:
          "/Users/magao-/Documents/Projetos/paroquia_santo_antonio_limao/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/inscricoes_casamento': (context) => InscricoesCasamentoPage(),
        '/missas_intencoes': (context) => MissasIntencoesPage(),
        '/pedido_missas': (context) => PedidoMissasPage(),
        '/pedido_intencoes': (context) => PedidoIntencoesPage(),
        '/santo_padroeiro': (context) => SantoPadroeiro(),
        '/sacramentos': (context) => SacramentosPage(),
        '/dizimista': (context) => DizimistaPage(),
        '/dizimosdoacoes': (context) => DoacoesPage(),
        '/terco_online': (context) => TercoOlinePage(),
        '/preparacaobatismo': (context) => PreparacaoPage(),
        '/festas': (context) => FestasPage(),
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
                MenuButton('Inscrições', '/inscricoes'),
                MenuButton('Missas e Intenções', '/missas_intencoes'),
                MenuButton('Dízimo e Doações', '/dizimosdoacoes'),
                MenuButton('Terço', '/terco_online'),
                MenuButton('Eventos', '/festas'),
                MenuButton('Santo Padroeiro', '/santo_padroeiro'),
                MenuButton('Sacramentos', '/sacramentos'),
                MenuButton('Liturgia Diária', '/missa_diaria'),
                MenuButton('Bíblia', '/biblia'),
                MenuButton('Santo do Dia', '/santo_do_dia'),
                MenuButton('Orações', '/oracoes'),
                MenuButton('Decanato São Pedro', '/paroquias'),
                MenuButton('Avisos Paroquiais', '/noticias'),
                MenuButton('Horários', '/horarios'),
                MenuButton('História da Paróquia', '/historiaparoquia'),
                SizedBox(height: 20),
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
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FestasPage extends StatefulWidget {
  @override
  _FestasPageState createState() => _FestasPageState();
}

class _FestasPageState extends State<FestasPage> {
  List<String> _bannerUrls = [];
  String? _jsonUrl;

  @override
  void initState() {
    super.initState();
    _fetchTxtFileUrl(); // Modificado para carregar a URL do arquivo .txt
  }

  // Função para obter a URL do JSON do arquivo .txt no Google Drive
  Future<void> _fetchTxtFileUrl() async {
    final txtUrl =
        'https://drive.google.com/uc?id=1NJbSFGsj-Ux2Z6lYm-uhbcbWEciKJKyW&export=download'; // Link direto do Google Drive
    try {
      final response = await http.get(Uri.parse(txtUrl));
      if (response.statusCode == 200) {
        final txtContent = response.body;
        setState(() {
          _jsonUrl = txtContent.trim(); // Contém a URL do JSON
        });
        _fetchBannerUrls(); // Chama para buscar os banners
      } else {
        print('Erro ao carregar arquivo TXT: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar arquivo TXT: $e');
    }
  }

  // Função para buscar os URLs dos banners usando o JSON
  Future<void> _fetchBannerUrls() async {
    if (_jsonUrl == null) return;
    try {
      final response = await http.get(Uri.parse(_jsonUrl!));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _bannerUrls =
              List<String>.from(data['images'].map((item) => item['url']));
        });
      } else {
        print('Erro ao carregar JSON: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: Center(
        child: _bannerUrls.isEmpty
            ? (_jsonUrl == null
                ? CircularProgressIndicator()
                : Text('Carregando banners...'))
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerUrls
                      .map((url) => BannerImage(imageUrl: url))
                      .toList(),
                ),
              ),
      ),
    );
  }
}

class BannerImage extends StatelessWidget {
  final String imageUrl;

  const BannerImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: constraints.maxWidth,
            );
          },
        ),
      ),
    );
  }
}

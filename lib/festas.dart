import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FestasPage extends StatefulWidget {
  @override
  _FestasPageState createState() => _FestasPageState();
}

class _FestasPageState extends State<FestasPage> {
  static const String _txtUrl =
      'https://drive.google.com/uc?id=1NJbSFGsj-Ux2Z6lYm-uhbcbWEciKJKyW&export=download';
  bool _isLoading = true;
  String? _errorMessage;
  bool _hasFetchedBanners = false;

  List<String> _bannerUrls = [];
  String? _jsonUrl;

  @override
  void initState() {
    super.initState();
    _fetchTxtFileUrl(); // Modificado para carregar a URL do arquivo .txt
  }

  Future<void> _fetchTxtFileUrl() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final response = await http.get(Uri.parse(_txtUrl));
      if (response.statusCode == 200) {
        _jsonUrl = response.body.trim();
        await _fetchBannerUrls();
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Falha ao carregar eventos (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Falha ao carregar eventos';
      });
    }
  }

  Future<void> _fetchBannerUrls() async {
    if (_hasFetchedBanners || _jsonUrl == null) return;
    _hasFetchedBanners = true;
    try {
      final response = await http.get(Uri.parse(_jsonUrl!));
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        if (decoded is Map && decoded['images'] is List) {
          final images = decoded['images'] as List;
          setState(() {
            _bannerUrls = images
                .where((item) => item is Map && item['url'] is String)
                .map<String>((item) => item['url'] as String)
                .toList();
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
            _errorMessage = 'Formato de dados inválido';
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Falha ao carregar JSON (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Falha ao carregar banners';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _isLoading
            ? const CircularProgressIndicator()
            : _errorMessage != null
                ? Text(_errorMessage!)
                : _bannerUrls.isEmpty
                    ? const Text('Nenhum banner disponível')
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: _bannerUrls.length,
                        itemBuilder: (context, index) {
                          return BannerImage(imageUrl: _bannerUrls[index]);
                        },
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
              width: constraints.maxWidth,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const SizedBox(
                  height: 200,
                  child: Center(child: CupertinoActivityIndicator()),
                );
              },
              errorBuilder: (context, error, stack) {
                return const SizedBox(
                  height: 200,
                  child: Center(child: Icon(Icons.broken_image, size: 48)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

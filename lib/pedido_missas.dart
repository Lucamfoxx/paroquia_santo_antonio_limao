import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PedidoMissasPage extends StatefulWidget {
  @override
  _PedidoMissasPageState createState() => _PedidoMissasPageState();
}

class _PedidoMissasPageState extends State<PedidoMissasPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _pedidoController = TextEditingController();
  bool _enviandoEmail = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _pedidoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos de Missas'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pedidos de Missas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do Solicitante',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _pedidoController,
              decoration: InputDecoration(
                labelText: 'Pedidos de Missas',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _enviandoEmail
                  ? null
                  : () async {
                      if (_nomeController.text.isEmpty ||
                          _pedidoController.text.isEmpty) {
                        _mostrarDialogo(context, 'Erro',
                            'Todos os campos devem ser preenchidos.');
                        return;
                      }

                      setState(() {
                        _enviandoEmail = true;
                      });

                      bool enviado = await _enviarPedidoPorEmail();
                      setState(() {
                        _enviandoEmail = false;
                      });

                      if (enviado) {
                        _mostrarDialogo(context, 'Email enviado',
                            'O pedido foi enviado com sucesso.');
                        _limparCampos();
                      } else {
                        _mostrarDialogo(context, 'Erro',
                            'Ocorreu um erro ao enviar o pedido.');
                      }
                    },
              child: _enviandoEmail
                  ? CircularProgressIndicator()
                  : Text('Enviar Pedido'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _enviarPedidoPorEmail() async {
    final smtpServer = gmail(
      dotenv.env['EMAIL_USERNAME']!,
      dotenv.env['EMAIL_PASSWORD']!,
    );

    final message = Message()
      ..from = Address(dotenv.env['EMAIL_USERNAME']!, 'eu')
      ..recipients.add('santoantoniolimao@gmail.com') // Destinatário do .env
      ..subject = 'Novo pedido de missas'
      ..text = '''
        Nome do Solicitante: ${_nomeController.text}
        Pedidos de Missas: ${_pedidoController.text}
      ''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  void _limparCampos() {
    _nomeController.clear();
    _pedidoController.clear();
  }

  void _mostrarDialogo(BuildContext context, String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

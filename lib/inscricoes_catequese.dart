import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/services.dart';

class InscricoesCatequesePage extends StatefulWidget {
  @override
  _InscricoesCatequesePageState createState() =>
      _InscricoesCatequesePageState();
}

class _InscricoesCatequesePageState extends State<InscricoesCatequesePage> {
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dddController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  List<XFile> fotos = [];
  bool _enviandoEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrições de Catequese'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associando a chave global ao formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título da página
              Text(
                'Página de Inscrições de Catequese',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Campo de texto para o nome
              TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo de texto para a idade
              TextFormField(
                controller: _idadeController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira sua idade';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Idade',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox(height: 10),
              // Campo de texto para o endereço
              TextFormField(
                controller: _enderecoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira seu endereço';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo de texto para o e-mail
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              // Campos de texto para DDD e número de telefone
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _dddController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Por favor, insira o DDD';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'DDD',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _telefoneController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Por favor, insira seu número de telefone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Número de Telefone',
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),SizedBox(height: 20),
              // Container com dicas para tirar uma boa foto
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Documentos necessarios',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- RG',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Comprovante de Residência',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Certidão de Batismo',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Certidão de Nascimento',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Container com dicas para tirar uma boa foto
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dicas para tirar uma ótima foto do documento:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- Tire a foto em um ambiente bem iluminado;',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Evite sombras que possam obscurecer o documento;',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Mantenha o documento reto e bem enquadrado na foto;',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '- Certifique-se de que o texto do documento está nítido e legível;',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await _selecionarImagem(ImageSource.camera);
                  }
                },
                child: Text('Adicionar Foto'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              // Exibição das fotos selecionadas
              for (int i = 0; i < fotos.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Adicione a funcionalidade para visualizar a imagem
                          },
                          child: Image.file(
                            File(fotos[i].path),
                            width: 100,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _removerImagem(i);
                        },
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              // Botão para enviar a inscrição
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    setState(() {
                      _enviandoEmail = true;
                    });
                    bool enviado = await _enviarInscricaoPorEmail();
                    setState(() {
                      _enviandoEmail = false;
                    });
                    if (enviado) {
                      _mostrarDialogo(context, 'Email enviado',
                          'O email foi enviado com sucesso.');
                      _limparCampos(); // Reiniciar a página de cadastro
                    } else {
                      _mostrarDialogo(context, 'Erro',
                          'Ocorreu um erro ao enviar o email.');
                    }
                  }
                },
                child: _enviandoEmail
                    ? CircularProgressIndicator() // Mostra o indicador de carregamento se estiver enviando
                    : Text('Enviar Inscrição'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para selecionar uma imagem da galeria ou da câmera
  Future<void> _selecionarImagem(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        fotos.add(pickedFile);
      });
    }
  }

  // Função para remover uma imagem da lista
  void _removerImagem(int index) {
    setState(() {
      fotos.removeAt(index);
    });
  }

  // Função para enviar a inscrição por e-mail
  Future<bool> _enviarInscricaoPorEmail() async {
    final smtpServer = SmtpServer(
      'smtp.sendgrid.net',
      username: 'apikey',
      password: '',
      port: 587,
    );

    final message = Message()
      ..from = Address('santoantoniolimao@gmail.com', 'Paroquia santo antonio')
      ..recipients.add('santoantoniolimao@gmail.com')
      ..subject = 'Nova inscrição de catequese'
      ..text = '''
        Nome: ${_nomeController.text}
        Idade: ${_idadeController.text}
        Endereço: ${_enderecoController.text}
        E-mail: ${_emailController.text}
        Telefone: (${_dddController.text}) ${_telefoneController.text}
      ''';

    for (final foto in fotos) {
      message.attachments.add(FileAttachment(File(foto.path)));
    }

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  // Função para limpar os controladores de texto e a lista de fotos
  void _limparCampos() {
    _nomeController.clear();
    _idadeController.clear();
    _enderecoController.clear();
    _emailController.clear();
    _dddController.clear();
    _telefoneController.clear();
    setState(() {
      fotos.clear();
    });
  }

  // Função para mostrar um diálogo na tela
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

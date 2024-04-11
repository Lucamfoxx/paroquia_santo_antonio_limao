import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter/services.dart';

class InscricoesBatismoPage extends StatefulWidget {
  @override
  _InscricoesBatismoPageState createState() => _InscricoesBatismoPageState();
}

class _InscricoesBatismoPageState extends State<InscricoesBatismoPage> {
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dddController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _localnascController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _cidadeController = TextEditingController();
  TextEditingController _nomePaiController = TextEditingController();
  TextEditingController _nomeMaeController = TextEditingController();
  TextEditingController _batismoPaiController = TextEditingController();
  TextEditingController _batismoMaeController = TextEditingController();
  TextEditingController _casadosreligiosoController = TextEditingController();
  TextEditingController _paroquiaCasamentoController = TextEditingController();
  TextEditingController _diocesecasamentoController = TextEditingController();
  TextEditingController _cidadeparoquiaController = TextEditingController();
  TextEditingController _bairroparoquiaController = TextEditingController();
  TextEditingController _nomepadrinhoController = TextEditingController();
  TextEditingController _telefonepadrinhoController= TextEditingController();
  TextEditingController _batismopadrinhoController = TextEditingController();

  TextEditingController _crismapadrinhoController= TextEditingController();
  TextEditingController _estadocivilController = TextEditingController();
  TextEditingController _casadapadrinhaController = TextEditingController();
  TextEditingController _nomemadrinhaController = TextEditingController();
  TextEditingController _telefonemadrinhoController = TextEditingController();
  TextEditingController _batismoMadrinhoController = TextEditingController();
  TextEditingController _crismaMadrinhoController = TextEditingController();
  TextEditingController _casadamadrinhaController = TextEditingController();
  TextEditingController _estadocivilmadrinhaController = TextEditingController();








  List<XFile> fotos = [];
  bool _enviandoEmail = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrição de Batismo'),
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
                'Inscrição de Batismo',
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
                    return 'Insira o nome do Batizando';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome do Batizando',
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
                controller: _dataController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira data de Nascimento';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),

              ),
              SizedBox(height: 10),
              // Campo de texto para o endereço
              TextFormField(
                controller: _localnascController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Local de Nascimento';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Local de Nascimento',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Campo de texto para o endereço
              TextFormField(
                controller: _enderecoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira seu endereço';
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
              // Campo de texto para o endereço
              TextFormField(
                controller: _bairroController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira o Bairro';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Bairro',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              SizedBox(height: 10),
              // Campo de texto para o endereço
              TextFormField(
                controller: _cepController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira o CEP';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'CEP',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              SizedBox(height: 10),
              // Campo de texto para o endereço
              TextFormField(
                controller: _cidadeController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira a Cidade';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Cidade',
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
                    return 'Insira seu e-mail';
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
                          return 'Insira o DDD';
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
                          return 'Insira seu número de telefone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Whatsapp Telefone',
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
              ),
                Text('\nPais',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 10),
              TextFormField(
                controller: _nomePaiController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o nome do pai';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome do Pai',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
                            
              SizedBox(height: 10),
              TextFormField(
                controller: _batismoPaiController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'insira o Batismo do pai';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Pai é Batizado?',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              
              
              SizedBox(height: 10),
              TextFormField(
                controller: _nomeMaeController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, insira o nome da mãe';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome da Mãe',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _batismoMaeController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'insira o batismo da mãe';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Mãe é Batizado?',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),   

///////////////////////////////////////////////////////////////////
              SizedBox(height: 10),
              SizedBox(height: 20),
              TextFormField(
                controller: _casadosreligiosoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Casados no Religioso';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Casados no Religioso (sim ou não)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
////////////////////////////////////////////////////////////////

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
                    SizedBox(height: 10),
                    Text(
                      '- Se forem casados no religioso preencher os dados de casamento.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\n- Se não forem casados no relgioso deixar em branco.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
//////////////////////////////////////////////////////////////////////////////
                Text('\nCasamento Religioso',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),



              SizedBox(height: 10),
              TextFormField(
                controller: _paroquiaCasamentoController,
                decoration: InputDecoration(
                  labelText: 'Paroquia do casamento',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _diocesecasamentoController,
                decoration: InputDecoration(
                  labelText: 'Diocese da Paroquia',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cidadeparoquiaController,
                decoration: InputDecoration(
                  labelText: 'Cidade da Paroquia',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              SizedBox(height: 10),
              TextFormField(
                controller: _bairroparoquiaController,
                decoration: InputDecoration(
                  labelText: 'Bairro da Paroquia',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
/////////////////////////////////////////////////////////////////
                Text('\nPadrinho',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 10),
              TextFormField(
                controller: _nomepadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Nome do Padrinho';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome do Padrinho',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _telefonepadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Telefone Padrinho';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Telefone Padrinho',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _batismopadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Batizado';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Batizado? (sim ou não)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _crismapadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Crismado';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Crismado? (sim ou não)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _estadocivilController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Estado Civil';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Estado civil do Padrinho',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
                            
              SizedBox(height: 10),
              TextFormField(
                controller: _casadapadrinhaController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira casado?';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Casado no Religioso ?',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              


///////////////////////////////////////////////////////////////////
///                
                Text('\nMadrinho',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _nomemadrinhaController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Nome da Madrinha';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nome da Madrinha',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),

              SizedBox(height: 10),
              TextFormField(
                controller: _telefonemadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Telefone Madrinho';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Telefone Madrinho',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _batismoMadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Batizada';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Batizada? (sim ou não)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _crismaMadrinhoController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Crismada?';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Crismada? (sim ou não)',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: _estadocivilmadrinhaController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira Estado Civil';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Estado civil do Madrinho',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
                          
              SizedBox(height: 10),
              TextFormField(
                controller: _casadamadrinhaController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Insira casada?';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Casada no Religioso ?',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
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
      ..subject = 'Nova inscrição de Batismo'
      ..text = '''
        ====================================
                       BATIZANDO 
        ====================================
asaa
        Nome: ${_nomeController.text}
        Data Nascimento: ${_dataController.text}
        Local Nascimento: ${_localnascController.text}
        Bairro: ${_bairroController.text}
        Cidade: ${_cidadeController.text}
        Endereço: ${_enderecoController.text}
        E-mail: ${_emailController.text}
        Telefone: (${_dddController.text}) ${_telefoneController.text}
        CEP: ${_cepController.text}

        ====================================
                        PAIS
        ====================================

        Nome Pai: ${_nomePaiController.text}
        Pai é Batizado: ${_batismoPaiController.text}
        Nome Mãe: ${_nomeMaeController.text}
        Mãe é Batizada: ${_batismoMaeController.text}
        Pais Casados no Religioso: ${_casadosreligiosoController.text}

        ====================================
               CASAMENTO RELIGIOSO PAIS
        ====================================

        Paroquia do Casamento: ${_paroquiaCasamentoController.text}
        Diocese da Paroquia do Casamento: ${_diocesecasamentoController.text}
        Bairro da Paroquia: ${_bairroparoquiaController.text}
        Cidade da Paroquia: ${_cidadeparoquiaController.text}

        ====================================
                      PADRINHO
        ====================================

        Nome do Padrinho: ${_nomepadrinhoController.text}
        Telefone Padrinho: ${_telefonepadrinhoController.text}
        Padrinho é Batizado: ${_batismopadrinhoController.text}
        Padrinho é Crismado: ${_crismapadrinhoController.text}
        Estado civil Padrinho ${_estadocivilController.text}
        Casado no religioso: ${_casadapadrinhaController.text}

        ====================================
                      MADRINHA
        ====================================

        Nome da Madrinha: ${_nomemadrinhaController.text}        
        Telefone Madrinho: ${_telefonemadrinhoController.text}
        Padrinho é Batizada: ${_batismoMadrinhoController.text}
        Padrinho é Crismada: ${_crismaMadrinhoController.text}
        Estado civil Madrinho ${_casadamadrinhaController.text}
        Casada no religioso: ${_estadocivilmadrinhaController.text}


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
    _dataController.clear();
    _localnascController.clear();    
    _bairroController.clear();    
    _cidadeController.clear();
    _enderecoController.clear();
    _emailController.clear();
    _dddController.clear();
    _telefoneController.clear();
    _cepController.clear();

    _nomePaiController.clear();
    _nomeMaeController.clear();
    _batismoPaiController.clear();
    _batismoMaeController.clear();

    _casadosreligiosoController.clear();
    _paroquiaCasamentoController.clear();
    _diocesecasamentoController.clear();
    _bairroparoquiaController.clear();
    _cidadeparoquiaController.clear();

    _nomepadrinhoController.clear();
    _telefonepadrinhoController.clear();
    _batismopadrinhoController.clear();
    _crismapadrinhoController.clear();
    _estadocivilController.clear();

    _nomemadrinhaController.clear();
    _telefonemadrinhoController.clear();
    _batismoMadrinhoController.clear();
    _crismaMadrinhoController.clear();
    _casadamadrinhaController.clear();
    _estadocivilmadrinhaController.clear();

    
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

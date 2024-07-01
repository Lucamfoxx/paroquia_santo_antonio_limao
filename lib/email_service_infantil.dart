// services/email_service.dart
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailService {
  final String username = 'apikey';
  final String password = '';
  final String fromEmail = 'santoantoniolimao@gmail.com';
  final String toEmail = 'santoantoniolimao@gmail.com';

  Future<bool> enviarInscricaoPorEmail(
      Map<String, String> formData, List<File> documentos) async {
    final smtpServer = SmtpServer('smtp.sendgrid.net',
        username: username, password: password, port: 587);

    final message = Message()
      ..from = Address(fromEmail, 'Paroquia santo antonio')
      ..recipients.add(toEmail)
      ..subject = 'Nova inscrição de Catequese Infantil'
      ..text = _buildEmailBody(formData);

    for (final documento in documentos) {
      message.attachments.add(FileAttachment(documento));
    }

    try {
      final sendReport = await send(message, smtpServer);
      print('Mensagem enviada com sucesso! ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Erro ao enviar o Email! $e');
      return false;
    }
  }

  String _buildEmailBody(Map<String, String> formData) {
    return '''
    ====================================
                   Catequizando
    ====================================
    Nome: ${formData['nome']}
    Local Nascimento: ${formData['localnasc']}
    Data Nascimento: ${formData['data']}
    Idade atual: ${formData['idade']}
    Bairro: ${formData['bairro']}
    Endereço: ${formData['endereco']}
    CEP: ${formData['cep']}
    Cidade: ${formData['cidade']}

    ========================================
               Informações da Criança
    ========================================
    Criança Estuda? ${formData['estuda']}
    Periodo Escolar: ${formData['periodo']}
    Batizado? ${formData['batismoCrianca']}
    1° Eucaristia? ${formData['criancaEucaristia']}

    ====================================
                      PAIS
    ====================================
    Nome Pai: ${formData['nomePai']}
    Nome Mãe: ${formData['nomeMae']}
    E-mail: ${formData['email']}
    Telefone: (${formData['ddd']}) ${formData['telefone']}
    Estado civil dos Pais: ${formData['estadoCivil']}
    Pais Casados no Religioso: ${formData['casadosReligioso']}
    Frequenta a Missa de Domingo: ${formData['missadominical']}
    Horário que frequenta a Missa: ${formData['horariomissa']}
    ''';
  }
}

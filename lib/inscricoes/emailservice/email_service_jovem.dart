// services/email_service_jovem.dart
import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailServiceJovem {
  final String username = dotenv.env['EMAIL_USERNAME']!;
  final String password = dotenv.env['EMAIL_PASSWORD']!;
  final String fromEmail = dotenv.env['EMAIL_USERNAME']!;
  final String toEmail = 'santoantoniolimao@gmail.com';

  Future<bool> enviarInscricaoPorEmail(
      Map<String, String> formData, List<File> documentos) async {
    // Configurando o servidor SMTP do Gmail
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(fromEmail, 'Paroquia Santo Antônio')
      ..recipients.add(toEmail)
      ..subject = 'Nova inscrição de Catequese Jovem'
      ..text = _buildEmailBody(formData);

    // Anexando os documentos enviados
    for (final documento in documentos) {
      message.attachments.add(FileAttachment(documento));
    }

    try {
      final sendReport = await send(message, smtpServer);
      print('Mensagem enviada com sucesso! ${sendReport.toString()}');
      return true;
    } catch (e) {
      print('Erro ao enviar o e-mail! $e');
      return false;
    }
  }

  String _buildEmailBody(Map<String, String> formData) {
    return '''
    ====================================
                   Jovem
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
               Informações do Jovem
    ========================================
    Jovem Estuda? ${formData['estuda']}
    Periodo Escolar: ${formData['periodo']}
    Batizado? ${formData['batismoJovem']}
    1° Eucaristia? ${formData['jovemEucaristia']}
    Crisma? ${formData['crisma']}

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
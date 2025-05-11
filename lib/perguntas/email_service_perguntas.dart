// email_service.dart
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EmailService {
  // TODO: In production, move email sending to a secure backend service
  static const String _recipientAddress = 'santoantoniolimao@gmail.com';
  static const String _subjectPrefix = '[Pergunta Padre] ';

  Future<bool> sendEmail(
      String subject, String nome, String email, String pergunta) async {
    final username = dotenv.env['EMAIL_USERNAME']!;
    final password = dotenv.env['EMAIL_PASSWORD']!;
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(
          dotenv.env['EMAIL_USERNAME']!, 'Paróquia Santo Antônio do Limão')
      ..recipients.add(_recipientAddress)
      ..subject = '$_subjectPrefix$subject'
      ..text = '''
Nome: $nome
E-mail: $email

Pergunta:
$pergunta
'''
      ..html = '''
<p><strong>Nome:</strong> $nome</p>
<p><strong>E-mail:</strong> $email</p>
<p><strong>Pergunta:</strong><br>$pergunta</p>
''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email enviado: ${sendReport.toString()}');
      return true;
    } on MailerException catch (e) {
      print('MailerException: ${e.message}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    } catch (e) {
      print('Erro inesperado ao enviar e-mail: $e');
      return false;
    }
  }
}

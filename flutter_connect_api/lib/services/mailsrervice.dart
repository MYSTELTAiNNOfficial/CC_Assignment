part of 'services.dart';

class MailService {
  Future<http.Response> sendMail(email) {
    return http.post(Uri.https(Const_Email.BASE_URL, '/index.php/api/mahasiswa/sendmail'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'email': email
        }));
  }
}

part of "services.dart";

class RajaOngkirService{
  static Future<http.Response> getOngkir(){
    return http.post(
      Uri.https(Const_RajaOngkir.BASE_URL, '/starter/cost'),
      headers: <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
        'key' : Const_RajaOngkir.API
      },
      body: jsonEncode(<String, dynamic>{
        'origin' : '120',
        'destination' : '300',
        'weight' : 1000,
        'courier' : 'jne'
      })
    );
  }
}
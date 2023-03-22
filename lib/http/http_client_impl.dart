import 'package:http/http.dart' as http;
import 'package:consumo_api/http/http_client.dart';

class HttpClientImpl implements IHttpClient {
  //!Criando instancia do http e armazenando em uma variavel
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}

//? Caso eu quisse implementar o DIO tambem eu faria o seguinte
//*criariamos a classe DioClient que implementaria o 'implements IHttpClient'(a mesma interface do http)
//*E ai ela seria obrigada a implementar a função get(mais escrita em forma do DIO)
//*Com isso nao dependeriamos só de um ou outro
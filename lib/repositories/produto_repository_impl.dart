// ignore_for_file: public_member_api_docs, sort_constructors_first
//!classe para implementar a interface

import 'dart:convert';

import 'package:consumo_api/http/http_client.dart';
import 'package:consumo_api/http/not_found_exceptions.dart';
import 'package:consumo_api/model/produto_model.dart';
import 'package:consumo_api/repositories/produto_repository.dart';

class ProdutoRepositoryImpl implements IProdutoRepository {
//!Criamos uma instancia da interface que criamos do http e armazenamos em uma variavel
  final IHttpClient client;

  ProdutoRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    final response = await client.get(url: "https://dummyjson.com/products");

    //verificando o statusCode da response
    if (response.statusCode == 200) {
      final List<ProdutoModel> produtosListVazia = [];

      //*decodificando o body (pois a resposta vem em formato de String)
      //*o jsonDecode transforma pra um map que é o que a api è
      final body = jsonDecode(response.body);

      //*preenchendo a lista de produtos(a api é uma lista de objetos)
      //*a api tem a lista de objetos chamada 'products', então passamos ela no body
      body['products'].map((item) {
        //*criamos um map que vai percorrer todos os itens dentro da lista
        //*e pra cada item dessa lista vamos criar um novo produtoModel e adicionar ele na lista
        final ProdutoModel produto = ProdutoModel.fromMap(item);
        produtosListVazia.add(produto);
      }).toList();

      return produtosListVazia;
      
    } else if (response.statusCode == 404) {
      //!se o statusCode nao for 200
      //!poderia fazer para os principais statusCode
      throw NotFoundExceptions(message: "A url informada não é valida");
    } else {
      //!pra um exception geral
      throw Exception("Não foi possivel carregar os produtos");
    }
  }
}

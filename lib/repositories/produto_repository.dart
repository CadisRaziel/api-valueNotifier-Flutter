//!classe feita para fazer a requisição para buscar a lista de produtos da api !!

//!contrato(interface)
//!dentro da interface a gente nao diz o que a função vai fazer, apenas criamos ela para quem
//!for implementar decida o que fazer dentro dela
import 'package:consumo_api/model/produto_model.dart';

abstract class IProdutoRepository {
  Future <List<ProdutoModel>> getProdutos();
}
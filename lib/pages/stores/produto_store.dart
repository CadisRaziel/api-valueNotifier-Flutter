// ignore_for_file: public_member_api_docs, sort_constructors_first
//!Classe responsavel por gerenciar o estado da nossa tela !!

import 'package:consumo_api/http/not_found_exceptions.dart';
import 'package:flutter/material.dart';

import 'package:consumo_api/model/produto_model.dart';
import 'package:consumo_api/repositories/produto_repository.dart';

class ProdutoStore {
  //*estancia do repositorio
  //!Usamos a nversão de dependencia e chamamos a interface, mais porque?
  //!pois é um principio do solid pois assim podemos passar qualquer repositorio que implemente o
  //!contrato de repositorio de produtos
  //!ou seja toda classe que implementa a interface IProdutoRepository
  //!vou conseguir acessar todos os metodos da interface independente se o repositorio(classes) for diferente
  final IProdutoRepository repository;
  ProdutoStore({
    required this.repository,
  });

  //*Variavel reativa para o loading
  //?Inicia como false pra nao ter nenhum loading na tela ao abrir o app
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  //*Variavel reativa para o state (atualiza o estado da nossa tela com a resposta)
  //?por ser uma lista de objetos, podemos iniciar ela como uma lista vazia
  final ValueNotifier<List<ProdutoModel>> state =
      ValueNotifier<List<ProdutoModel>>([]);

  //*Variavel reativa para o erro
  final ValueNotifier<String> erro = ValueNotifier<String>("");

  //!requisição ao repositorio
  Future getProdutos() async {
    isLoading.value =
        true; //? quando ele começar a pegar itens da api ele vai mostrar um loading
    try {
      final result = await repository.getProdutos();
      state.value =
          result; //? -> vamos popular o state(A lista de produtoModel com os dados da api que é uma lista de objeto)
    } on NotFoundExceptions catch (e) {
      //on NotFoundExceptions-> para ver se no momento da requisição aconteceu um erro
      erro.value = e.message; //?-> o 'e' é da classe NotFoundExceptions
      //?populamos nosso erro com o erro que criamos la na requisição
    } catch (e) {
      //? caso o erro passar pela exeção la da chamada da api ele vai cair aqui
      //? caso der algum outro erro
      erro.value = e.toString();
    }

    //?Ao terminar todo processo a gente fala pro isLoading voltar a ser falto e remover o loading da tela
    isLoading.value = false;
  }
}

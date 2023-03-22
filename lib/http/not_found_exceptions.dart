class NotFoundExceptions implements Exception {
  //quando a url nao for encontrada
  final String message;
  NotFoundExceptions({
    required this.message,
  });
}

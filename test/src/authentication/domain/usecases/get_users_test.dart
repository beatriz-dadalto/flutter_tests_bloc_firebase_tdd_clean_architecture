import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_authentication_repository.dart';

// 1. What does the class depend on
// Answer: AuthenticationRepository
// 2. How can we create a fake version of the dependency
// Answer: Use Mocktail
// 3. How do we control what our dependencies do
// Answer: using the Mocktail's APIs

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  /* setUp roda antes de cada teste.
  Cria o mock e o caso de uso que será testado. */
  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository: repository);
  });

  // Cria dados padrão para o teste.
  const testResponse = [User.empty()];

  test('Should call [AuthRepo.getUsers] and return [List<User>]', () async {
    // 1. Arrange - what we need to work (preparacao)
    /*
    - Diz ao mock o que fazer quando o método getUsers for chamado.
    - Aqui, ele vai retornar Right(testResponse), que significa sucesso com
    a lista de usuários.
    */
    when(
      () => repository.getUsers(),
    ).thenAnswer((_) async => const Right(testResponse));

    // 2. Act | Ação (executa o que quer testar)
    final result = await usecase();

    // 3. Assert | Verificação (confirma se funcionou como esperado)
    // Verifica se o resultado foi sucesso e igual ao esperado.
    // dynamic because I dont need the left value (Failure). put dynamic where you dont need the value
    expect(result, equals(const Right<dynamic, List<User>>(testResponse)));

    // Verifica se o resultado foi sucesso.
    // Use verify para garantir que métodos foram chamados corretamente.
    // Confirma que o método foi chamado com os parâmetros certos, uma vez.
    verify(() => repository.getUsers()).called(1);

    // Garante que nenhum outro método do mock foi chamado.
    verifyNoMoreInteractions(repository);
  });
}

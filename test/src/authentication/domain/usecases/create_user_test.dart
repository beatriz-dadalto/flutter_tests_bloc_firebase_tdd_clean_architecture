import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:mocktail/mocktail.dart';

// 1. What does the class depend on
// Answer: AuthenticationRepository
// 2. How can we create a fake version of the dependency
// Answer: Use Mocktail
// 3. How do we control what our dependencies do
// Answer: using the Mocktail's APIs

// fake version of the dependency
class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository: repository);
  });

  const params = CreateUserParams.empty();

  test('should call [AuthRepo.createUser]', () async {
    // 1. Arrange - what we need to work
    when(
      () => repository.createUser(
        createdAt: any(named: 'createdAt'),
        name: any(named: 'name'),
        avatar: any(named: 'avatar'),
      ),
    ).thenAnswer((_) async => const Right(null)); // null -> void

    // 2. Act
    final result = await usecase(params);

    // 3. Assert
    // dynamic because I dont need the left (Failure). put dynamic where you dont need the result
    expect(result, equals(const Right<dynamic, void>(null)));
    verify(
      () => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      ),
    ).called(1);
    verifyNoMoreInteractions(repository);
  });
}

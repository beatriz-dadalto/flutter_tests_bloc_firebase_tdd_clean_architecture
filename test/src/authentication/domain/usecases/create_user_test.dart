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

  test('should call [AuthRepo.createUser]', () async {
    // Arrange - what we need to work

    // Act

    // Assert
  });
}

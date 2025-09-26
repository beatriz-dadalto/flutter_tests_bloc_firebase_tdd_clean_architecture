import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  final AuthenticationRepository _repository;

  GetUsers({required AuthenticationRepository repository})
    : _repository = repository;

  @override
  ResultFuture<List<User>> call() async {
    return _repository.getUsers();
  }
}

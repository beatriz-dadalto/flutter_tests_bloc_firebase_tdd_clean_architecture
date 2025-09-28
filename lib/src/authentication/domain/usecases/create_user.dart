import 'package:equatable/equatable.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/core/usecase/usecase.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  CreateUser({required AuthenticationRepository repository})
    : _repository = repository;

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async {
    return _repository.createUser(
      createdAt: params.createdAt,
      name: params.name,
      avatar: params.avatar,
    );
  }
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  const CreateUserParams.empty()
    : this(
        createdAt: '_empty.createdAt',
        name: '_emprty.name',
        avatar: '_empty.avatar',
      );

  final String name;
  final String createdAt;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}

import 'package:flutter_tests_bloc_firebase_tdd_clean_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:mocktail/mocktail.dart';

/* Cria uma versão falsa do AuthenticationRepository para testar sem precisar
 de banco de dados ou internet. */
class MockAuthRepo extends Mock implements AuthenticationRepository {}

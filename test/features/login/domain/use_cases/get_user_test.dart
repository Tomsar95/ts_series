import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/features/core/usecases/usecase.dart';
import 'package:tv_series/features/login/domain/entities/user.dart';
import 'package:tv_series/features/login/domain/repositories/user_repository.dart';
import 'package:tv_series/features/login/domain/usecases/get_user.dart';

import 'get_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late final GetUser useCase;
  late final MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetUser(mockUserRepository);
  });

  const tCharacter = User(
    name: 'tomas',
    password: 'tom123'
  );


  test('should get Concrete Character from the repository', () async {
    // arrange
    when(mockUserRepository.getUser())
        .thenAnswer((_) async => const Right(tCharacter));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, const Right(tCharacter));
    verify(mockUserRepository.getUser());
    verifyNoMoreInteractions(mockUserRepository);
  });
}
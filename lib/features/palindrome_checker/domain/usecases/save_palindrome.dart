import 'package:her_future_coding_challenge/core/usecases/usecases.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/repositories/palindrome_repository.dart';

class SavePalindrome implements UseCase<void, PalindromeEntity> {
  final PalindromeRepository repository;

  SavePalindrome(this.repository);

  @override
  Future<void> call(PalindromeEntity palindrome) async {
    return await repository.savePalindrome(palindrome);
  }
}

import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';

abstract class PalindromeRepository {
  Future<void> savePalindrome(PalindromeEntity palindrome);
  Future<List<PalindromeEntity>> getHistory();
  Future<void> clearHistory();
}

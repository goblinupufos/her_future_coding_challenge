import 'package:her_future_coding_challenge/features/palindrome_checker/data/models/palindrome_model.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/data/sources/palindrome_local_data_source.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/repositories/palindrome_repository.dart';

class PalindromeRepositoryImpl implements PalindromeRepository {
  final PalindromeLocalDataSource localDataSource;

  PalindromeRepositoryImpl({required this.localDataSource});

  @override
  Future<void> clearHistory() async {
    await localDataSource.clearHistory();
  }

  @override
  Future<List<PalindromeEntity>> getHistory() async {
    final models = await localDataSource.getHistory();
    return models
        .map(
          (model) => PalindromeEntity(
            word: model.word,
            isPalindrome: model.isPalindrome,
          ),
        )
        .toList();
  }

  @override
  Future<void> savePalindrome(PalindromeEntity palindrome) async {
    final history = await getHistory();

    // Convert to PalindromeModel before saving
    final updatedHistory =
        history
            .map(
              (e) =>
                  PalindromeModel(word: e.word, isPalindrome: e.isPalindrome),
            )
            .toList();

    updatedHistory.add(
      PalindromeModel(
        word: palindrome.word,
        isPalindrome: palindrome.isPalindrome,
      ),
    );

    await localDataSource.saveHistory(updatedHistory);
  }
}

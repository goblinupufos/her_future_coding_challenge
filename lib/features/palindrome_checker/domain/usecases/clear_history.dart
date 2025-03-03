import 'package:her_future_coding_challenge/core/usecases/usecases.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/repositories/palindrome_repository.dart';

class ClearHistory implements UseCase<void, NoParams> {
  final PalindromeRepository repository;

  ClearHistory(this.repository);

  @override
  Future<void> call(NoParams params) async {
    await repository.clearHistory();
  }
}

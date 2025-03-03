import 'package:her_future_coding_challenge/core/usecases/usecases.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/repositories/palindrome_repository.dart';

class GetHistory implements UseCase<List<PalindromeEntity>, NoParams> {
  final PalindromeRepository repository;

  GetHistory(this.repository);

  @override
  Future<List<PalindromeEntity>> call(NoParams params) async {
    return await repository.getHistory();
  }
}

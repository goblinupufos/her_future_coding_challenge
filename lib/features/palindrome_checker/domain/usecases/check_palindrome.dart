import 'package:her_future_coding_challenge/core/usecases/usecases.dart';

class CheckPalindrome implements UseCase<bool, String> {
  @override
  Future<bool> call(String word) async {
    final filtered = word.toLowerCase().replaceAll(' ', '');
    return filtered == filtered.split('').reversed.join();
  }
}

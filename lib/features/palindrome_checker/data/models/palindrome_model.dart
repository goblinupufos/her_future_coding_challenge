import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';

class PalindromeModel extends PalindromeEntity {
  const PalindromeModel({required super.word, required super.isPalindrome});

  factory PalindromeModel.fromJson(Map<String, dynamic> json) {
    return PalindromeModel(
      word: json['word'],
      isPalindrome: json['isPalindrome'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'word': word, 'isPalindrome': isPalindrome};
  }
}

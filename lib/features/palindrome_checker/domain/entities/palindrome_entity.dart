import 'package:equatable/equatable.dart';

class PalindromeEntity extends Equatable {
  final String word;
  final bool isPalindrome;

  const PalindromeEntity({required this.word, required this.isPalindrome});

  @override
  List<Object?> get props => [word, isPalindrome];
}

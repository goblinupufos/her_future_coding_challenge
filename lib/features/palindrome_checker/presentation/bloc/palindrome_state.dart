import 'package:equatable/equatable.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';

abstract class PalindromeState extends Equatable {
  const PalindromeState();

  @override
  List<Object?> get props => [];
}

class PalindromeInitial extends PalindromeState {}

class PalindromeChecked extends PalindromeState {
  final String word;
  final bool isPalindrome;
  final List<PalindromeEntity> history;

  const PalindromeChecked({
    required this.word,
    required this.isPalindrome,
    required this.history,
  });

  @override
  List<Object?> get props => [word, isPalindrome, history];
}

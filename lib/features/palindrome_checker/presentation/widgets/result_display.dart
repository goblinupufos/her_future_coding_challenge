import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/core/styles/theme.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_state.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalindromeBloc, PalindromeState>(
      builder: (context, state) {
        if (state is PalindromeChecked && state.word.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              state.isPalindrome
                  ? "'${state.word}' is a palindrome"
                  : "'${state.word}' is not a palindrome",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    state.isPalindrome
                        ? AppTheme.primaryColor
                        : Colors.redAccent,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

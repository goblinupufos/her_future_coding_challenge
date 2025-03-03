import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_state.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PalindromeBloc, PalindromeState>(
      builder: (context, state) {
        if (state is PalindromeChecked && state.history.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.history.length,
            itemBuilder: (context, index) {
              final item = state.history[index];
              return ListTile(
                title: Text(item.word),
                subtitle: Text(
                  item.isPalindrome ? "Palindrome" : "Not a palindrome",
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

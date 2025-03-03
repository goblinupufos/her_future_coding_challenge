import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/core/styles/theme.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_event.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/widgets/history_list.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/widgets/input_field.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/widgets/result_display.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Palindrome Checker"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField(),
            SizedBox(height: 16),
            ResultDisplay(),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: HistoryList()),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<PalindromeBloc>().add(ClearHistoryEvent());
                      },
                      icon: Icon(Icons.delete, color: AppTheme.accentColor),
                      label: Text("Clear History"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

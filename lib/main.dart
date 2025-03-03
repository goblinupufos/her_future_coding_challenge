import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/core/styles/theme.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/data/repositories/palindrome_repository_impl.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/data/sources/palindrome_local_data_source.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/check_palindrome.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/clear_history.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/get_history.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/save_palindrome.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_bloc.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_event.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final localDataSource = PalindromeLocalDataSourceImpl(prefs);
  final repository = PalindromeRepositoryImpl(localDataSource: localDataSource);

  final checkPalindromeUseCase = CheckPalindrome();
  final getHistoryUseCase = GetHistory(repository);
  final savePalindromeUseCase = SavePalindrome(repository);
  final clearHistoryUseCase = ClearHistory(repository);

  runApp(
    MainApp(
      checkPalindrome: checkPalindromeUseCase,
      getHistory: getHistoryUseCase,
      savePalindrome: savePalindromeUseCase,
      clearHistory: clearHistoryUseCase,
    ),
  );
}

class MainApp extends StatelessWidget {
  final CheckPalindrome checkPalindrome;
  final GetHistory getHistory;
  final SavePalindrome savePalindrome;
  final ClearHistory clearHistory;

  const MainApp({
    super.key,
    required this.checkPalindrome,
    required this.getHistory,
    required this.savePalindrome,
    required this.clearHistory,
  });

  @override
  Widget build(BuildContext context) {
    // Load history from disk on app start
    return BlocProvider(
      create:
          (context) => PalindromeBloc(
            checkPalindrome: checkPalindrome,
            getHistory: getHistory,
            savePalindrome: savePalindrome,
            clearHistory: clearHistory,
          )..add(LoadHistoryEvent()),
      child: MaterialApp(
        title: 'Palindrome Checker',
        theme: AppTheme.themeData,
        home: HomePage(),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_future_coding_challenge/core/usecases/usecases.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/entities/palindrome_entity.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/check_palindrome.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/clear_history.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/get_history.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/domain/usecases/save_palindrome.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_event.dart';
import 'package:her_future_coding_challenge/features/palindrome_checker/presentation/bloc/palindrome_state.dart';

class PalindromeBloc extends Bloc<PalindromeEvent, PalindromeState> {
  final CheckPalindrome checkPalindrome;
  final GetHistory getHistory;
  final SavePalindrome savePalindrome;
  final ClearHistory clearHistory;

  List<PalindromeEntity> history = [];

  PalindromeBloc({
    required this.checkPalindrome,
    required this.getHistory,
    required this.savePalindrome,
    required this.clearHistory,
  }) : super(PalindromeInitial()) {
    on<CheckPalindromeEvent>(_onCheckPalindrome);
    on<LiveCheckPalindromeEvent>(_onLiveCheckPalindrome);
    on<ClearHistoryEvent>(_onClearHistory);
    on<LoadHistoryEvent>(_onLoadHistory);
  }

  void _onLiveCheckPalindrome(
    LiveCheckPalindromeEvent event,
    Emitter<PalindromeState> emit,
  ) async {
    final isPalindrome = await checkPalindrome(event.word);
    emit(
      PalindromeChecked(
        word: event.word,
        isPalindrome: isPalindrome,
        history: history,
      ),
    );
  }

  void _onCheckPalindrome(
    CheckPalindromeEvent event,
    Emitter<PalindromeState> emit,
  ) async {
    final isPalindrome = await checkPalindrome(event.word);
    final newEntry = PalindromeEntity(
      word: event.word,
      isPalindrome: isPalindrome,
    );

    // Fetch the latest history from storage
    final updatedHistory = await getHistory(NoParams());
    updatedHistory.add(newEntry);

    // Persist the new history on disk
    await savePalindrome(newEntry);

    history = updatedHistory;
    emit(
      PalindromeChecked(
        word: event.word,
        isPalindrome: isPalindrome,
        history: history,
      ),
    );
  }

  void _onClearHistory(
    ClearHistoryEvent event,
    Emitter<PalindromeState> emit,
  ) async {
    await clearHistory(NoParams());
    history = [];

    // Preserve the last checked word in state
    if (state is PalindromeChecked) {
      final lastWord = (state as PalindromeChecked).word;
      final isPalindrome = (state as PalindromeChecked).isPalindrome;
      emit(
        PalindromeChecked(
          word: lastWord,
          isPalindrome: isPalindrome,
          history: [],
        ),
      );
    } else {
      emit(PalindromeInitial());
    }
  }

  void _onLoadHistory(
    LoadHistoryEvent event,
    Emitter<PalindromeState> emit,
  ) async {
    history = await getHistory(NoParams());
    emit(PalindromeChecked(word: "", isPalindrome: false, history: history));
  }
}

abstract class PalindromeEvent {}

class CheckPalindromeEvent extends PalindromeEvent {
  final String word;
  CheckPalindromeEvent(this.word);
}

class LiveCheckPalindromeEvent extends PalindromeEvent {
  final String word;
  LiveCheckPalindromeEvent(this.word);
}

class ClearHistoryEvent extends PalindromeEvent {}

class LoadHistoryEvent extends PalindromeEvent {}
